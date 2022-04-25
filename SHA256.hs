module SHA256 where
-- Toma un mensaje (string) y lo convierte a binario, extiende segun SHA 256 y lo divide en pieza de 

import Data.Char (ord) --Lo preciso para usar "ord" que determina el indice ASCII

import Sigmas
import Auxiliares 
import Hashes  --(hh0, hh1, hh2, hh3, hh4, hh5, hh6, hh7)



s2bm1 :: [Char] -> [Int]
s2bm1 x = concatMap (bin8 . ord) x ++ [1]
--Convierte string en binario y agrega un 1

--------------------------------------------------------------------------------------------------------------------------------------------
me :: [Char] -> [Int]
me x = s2bm1 x ++ replicate (mod (448-length (init (s2bm1 x))-1) 512) 0 ++ completar64 (bin8 (length (concatMap (bin8 . ord) x)))
--Pasa string a binario y agrega un 1 con s2bm1, luego agrega una cantidad dada de 0s y despues agrega el largo del mensaje en binario y 
--en 64 bits agregando 0's hasta completar 64bits si es necesario. el resultado es un lista con largo multiplo de 512
--------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------
mepw :: [Char] -> [[[Int]]]
mepw = divpieza.div512.me
--Mensaje extendido ordenado por piezas y palabras (de 32 bits) de cada pieza
--------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------
--Tres funciones para pasar del mensaje extendido ordenado en piezas y palabras a lo mismo pero en decimal
med1 :: [[Int]] -> [Int]
med1 = map b2d
--Pasa una lista de listas de binarios a una lista de decimales correspondientes

med :: [[[Int]]] -> [[Int]]
med = map med1
--Igual al anterior pero un "orden" mas

mepwd :: [Char] -> [[Int]]
mepwd = med.mepw
--Pasa la lista de palabras por pieza del mesaje extendido a lo mismo pero en decimal
----------------------------------------------------------------------------------------------------------

wnp1 :: [[Int]]->Int->[Int]
wnp1 x n = s1(x!!(n-2)) 

wnp2 :: [[Int]]->Int->[Int]
wnp2 x n = s0(x!!(n-15))

wn :: [[Int]] -> [[Int]]
wn x = x ++ [sm2324 (s1(x!!(length x - 2))) (x!!((length x)-7)) ( s0(x!!(length x - 15))) (x!!((length x )-16))]
--Crea las palabaras w17 a w64 a partir de las palabras w1 a w16

iterwn :: [[Int]] -> [[Int]]
iterwn x = iterate wn x !! 48
--Aplica 48 veces la funcion wn

mep64w :: [Char] -> [[[Int]]]
mep64w x = map iterwn (mepw x)
--Mensaje extendido ordenado por piezas y palabras (de 32 bits) de cada pieza, incluye las palabras 17 a 64
 
t1 :: [[Int]]->[[Int]]->[[Int]]->Int->[Int]
t1 h k w n = sm2325  (h!!7) (s11(h!!4)) (ch (h!!4) (h!!5) (h!!6)) (k!!n) (w!!n)

t2 :: [[Int]] -> [Int]
t2 h = sm2322 (s00(h!!0)) (maj (h!!0) (h!!1) (h!!2))


men :: [Char]
men = "Hello world this is SatoshiUY Hello world this is SatoshiUY Hello world this is SatoshiUY"

consw :: [[Int]] -> [[Int]] -> [Char] -> Int -> [[Int]]
consw h hi x n
        | ((h!!8)!!0)<64 =  [(sm2322   ( t1 h k0 (mep64w(x)!!n) ((h!!8)!!0) )     (t2 h)   )]  ++ 
                                [h!!0] ++
                                [h!!1] ++
                                [h!!2] ++
                                [sm2322 (h!!3) (t1 h k0 (mep64w(x)!!n) ((h!!8)!!0))] ++
                                [h!!4] ++
                                [h!!5] ++ 
                                [h!!6]  ++ 
                                [[ (h!!8)!!0 + 1 ]]
        | otherwise = (zipWith sm2322 (take 8 h) hi )  ++ [[0]]  


iterea :: [[Int]] -> [[Int]] -> [Char] -> Int -> [[[Int]]]
iterea h hi x n = h : iterea  (consw h hi x n ) hi x n

itere :: [[Int]]-> [[Int]]->  [Char]->Int-> [[Int]]
itere h hi x n = (iterea h hi x n )!! 65


len :: [Char] -> Int
len x = length (mep64w x)

it2 :: [[Int]] -> [[Int]] -> [Char] -> Int -> [[[Int]]]
it2 h hi x n = itere h hi x n : it2 (itere h hi x n) (itere h hi x n) x (n+1)

ite2 :: Int -> [[Int]] -> [[Int]] -> [Char] -> Int -> [[Int]]
ite2 k h hi x n = it2 h hi x n !! k
 
sha256 :: [Char] -> [Char]
sha256 x = concat (b2h (concat (take 8 (ite2 (len x -1) h0 h0 x 0 ))))