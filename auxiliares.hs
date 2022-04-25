module Auxiliares where
import Text.ParserCombinators.Parsec.Char (CharParser)


sm2322 :: [Int]->[Int]->[Int]
sm2322 x y = completar32 (bin (mod (b2d x + b2d y) (2^32)))
--Suma modulo 2^32 de tres listas, los pasa de binario a decimal, los suma, los pasa a binario y completa para que tengan 32 bits. 

sm2324 :: [Int]->[Int]->[Int]->[Int]->[Int]
sm2324 x y z w = completar32 (bin (mod (b2d x + b2d y + b2d z + b2d w) (2^32)))
--Suma modulo 2^32 de tres listas, los pasa de binario a decimal, los suma, los pasa a binario y completa para que tengan 32 bits. 

sm2325 :: [Int]->[Int]->[Int]->[Int]->[Int]->[Int]
sm2325 x y z w t = completar32 (bin (mod (b2d x + b2d y + b2d z + b2d w + b2d t) (2^32)))
--Suma modulo 2^32 de tres listas, los pasa de binario a decimal, los suma, los pasa a binario y completa para que tengan 32 bits.

completar8 :: [Int] -> [Int]
completar8 x = if length x == 8 then x else replicate (8-length x) 0 ++ x
--Completa una lista con 0's hasta que tenga largo de 8 bits (preciso 8 bits para representar cualquier caracter ASCII)

completar32 :: [Int] -> [Int]
completar32 x = if length x == 32 then x else replicate (32-length x) 0 ++ x
--Completa una lista con 0's hasta que tenga largo de 32 bits, el largo de las palabras

completar64 :: [Int] -> [Int]
completar64 x = if length x == 64 then x else replicate (64-length x) 0 ++ x
--Completa una lista con 0's hasta que tenga largo de 64 bits 

bin :: Int -> [Int]
bin 0 = []
bin n = bin (div n 2) ++ [mod n 2]
-- Convierte un numero a binario

bin8 :: Int -> [Int]
bin8 = completar8.bin

bin32 :: Int -> [Int]
bin32 = completar32.bin
--Toma un numero cualquiera, lo convierte a binario y completa para que tenga 8 bits.

--Auxiliar que numera cada caracter de hexadecimal
auxh :: Char -> Int
auxh a
    | a == '0' = 0
    | a == '1' = 1
    | a == '2' = 2
    | a == '3' = 3
    | a == '4' = 4
    | a == '5' = 5
    | a == '6' = 6
    | a == '7' = 7
    | a == '8' = 8
    | a == '9' = 9
    | a == 'a' = 10
    | a == 'b' = 11
    | a == 'c' = 12
    | a == 'd' = 13
    | a == 'e' = 14
    | a == 'f' = 15
    |otherwise = error "error"

div4 :: [Int] -> [[Int]]
div4 x
    |not (null (drop 4 x)) = take 4 x : div4 (drop 4 x)
    |null (drop 4 x) = [x]
    |otherwise = error "error"
--Divide lista en lista de listas de 32 elementos, las llamadas palabras

h2d :: String -> Int
h2d [] = 0
h2d (a:as) = auxh a*16^(length (a:as)-1) + h2d as
--Convierte de hexadecimal a decimal

h2b :: String -> [Int]
h2b = bin32.h2d
--convierte de hexadecimal a binario


b2d :: [Int]->Int
b2d [] = 0
b2d (a:as) = a*2^(length (a:as)-1) + b2d as
--convierte de binario a decimal


auxh1 :: Integral a => a -> [a]
auxh1 0 = []
auxh1 n = auxh1 (div n 16) ++ [mod n 16]
-- Convierte un numero a hex sin letras

auxh2 :: Int -> Char
auxh2 a
    | a == 0 = '0'
    | a == 1 = '1'
    | a == 2 = '2'
    | a == 3 = '3'
    | a == 4 = '4'
    | a == 5 = '5'
    | a == 6 = '6'
    | a == 7 = '7'
    | a == 8 = '8'
    | a == 9 = '9'
    | a == 10 = 'a'
    | a == 11 = 'b'
    | a == 12 = 'c'
    | a == 13 = 'd'
    | a == 14 = 'e'
    | a == 15 = 'f'
    |otherwise = error "error"

d2h :: Int -> String
d2h x 
    |x==0 = "0" 
    |otherwise = map auxh2 (auxh1 x)

b2h :: [Int] -> [String]
b2h x
    |x==[0] = ["0"]
    |otherwise = map d2h (map b2d (div4 x))

div512 :: [Int] -> [[Int]]
div512 x
    |not (null (drop 512 x)) = take 512 x : div512 (drop 512 x)
    |null (drop 512 x) = [x]
    |otherwise = error "error"
--Divide lista en lista de listas de 512 elementos, las llamadas piezas

div32 :: [Int] -> [[Int]]
div32 x
    |not (null (drop 32 x)) = take 32 x : div32 (drop 32 x)
    |null (drop 32 x) = [x]
    |otherwise = error "error"
--Divide lista en lista de listas de 32 elementos, las llamadas palabras

divpieza :: [[Int]] -> [[[Int]]]
divpieza [] = []
divpieza x = div32 (head x) : divpieza (drop 1 x)
--Divide la lista de piezas en listas de listas de palabras, es decir divide cada pieza en una lista de palabras. 
--{ (Pieza1:pal1:[]...pal16:[])...(Piezan:pal1:[]...pal16:[])}