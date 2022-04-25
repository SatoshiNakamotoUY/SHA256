module Oelementales where
    
nott :: [Int] -> [Int]
nott [] = []
nott (a:as) 
    | a == 0 = 1 : nott as 
    | otherwise = 0 : nott as
-- Invierte valores

andd :: [Int] -> [Int] -> [Int]
andd []_ = []
andd _[] = []
andd (a:as) (b:bs) = a*b : andd as bs
-- Multiplica elemento a elemento. Si ambos son 1 da 1 si no 0.

xorr :: [Int] -> [Int] -> [Int]
xorr []_ = []
xorr _[] = []
xorr (a:as) (b:bs) = max a b - min a b : xorr as bs
-- Devuelve 0 a menos que uno y solo uno de los dos elementos sea un 1

rotr :: [Int] -> Int -> [Int]
rotr x n 
    |n == 0       = x 
    |otherwise    = rotr (last x : take (length x - 1) x) (n-1)
-- Mueve los n ultimos elementos al principrio de la lista

shiftr :: [Int] -> Int -> [Int]
shiftr x n
    | n == 0 = x
    | otherwise  = shiftr (0 : init x) (n-1)
-- Elminina lso n ultimos elemento y agrega n 0's al principio de la lista

