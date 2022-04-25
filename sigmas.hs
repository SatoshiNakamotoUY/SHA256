module Sigmas where
import Oelementales

s0 :: [Int]->[Int]
s0 x = xorr (xorr (rotr x 7) (rotr x 18)) (shiftr x 3)

s1 :: [Int]->[Int]
s1 x = xorr (xorr (rotr x 17) (rotr x 19)) (shiftr x 10)

--Compresion Parte 1
ch :: [Int] -> [Int] -> [Int] -> [Int]
ch x y z = xorr (andd x y) (andd (nott x) z)

maj :: [Int] -> [Int] -> [Int] -> [Int]
maj x y z = xorr (xorr (andd x y) (andd x z)) (andd y z)

--Compresion Parte 2
s00 :: [Int]->[Int]
s00 x = xorr (xorr (rotr x 2) (rotr x 13)) (rotr x 22)

s11 :: [Int]->[Int]
s11 x = xorr (xorr (rotr x 6) (rotr x 11)) (rotr x 25)
