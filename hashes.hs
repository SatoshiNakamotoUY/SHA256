module Hashes where
    
import Auxiliares ( h2b )
import Data.Char (ord) --Lo preciso para usar "ord" que determina el indice ASCII

--Cargo hashes       
hh0 :: [Int]
hh0 = h2b "6a09e667"
hh1 :: [Int]
hh1 = h2b "bb67ae85"
hh2 :: [Int]
hh2 = h2b "3c6ef372"
hh3 :: [Int]
hh3 = h2b "a54ff53a"
hh4 :: [Int]
hh4 = h2b "510e527f"
hh5 :: [Int]
hh5 = h2b "9b05688c"
hh6 :: [Int]
hh6 = h2b "1f83d9ab"
hh7 :: [Int]
hh7 = h2b "5be0cd19"

h00 :: [[Int]]
h00 = [hh0] ++ [hh1] ++ [hh2] ++ [hh3] ++ [hh4] ++ [hh5] ++ [hh6] ++ [hh7]

h0 :: [[Int]]
h0=h00 ++ [[0]]

--Cargo Constantes 
kk1 :: [Int]
kk1 = h2b "428a2f98"
kk2 :: [Int]
kk2 = h2b "71374491"
kk3 :: [Int]
kk3 = h2b "b5c0fbcf"
kk4 :: [Int]
kk4 = h2b "e9b5dba5"
kk5 :: [Int]
kk5 = h2b "3956c25b"
kk6 :: [Int]
kk6 = h2b "59f111f1"
kk7 :: [Int]
kk7 = h2b "923f82a4"
kk8 :: [Int]
kk8 = h2b "ab1c5ed5"
kk9 :: [Int]
kk9 = h2b "d807aa98"
kk10 :: [Int]
kk10 = h2b "12835b01"
kk11 :: [Int]
kk11 = h2b "243185be"
kk12 :: [Int]
kk12 = h2b "550c7dc3"
kk13 :: [Int]
kk13 = h2b "72be5d74"
kk14 :: [Int]
kk14 = h2b "80deb1fe"
kk15 :: [Int]
kk15 = h2b "9bdc06a7"
kk16 :: [Int]
kk16 = h2b "c19bf174"
kk17 :: [Int]
kk17 = h2b "e49b69c1"
kk18 :: [Int]
kk18 = h2b "efbe4786"
kk19 :: [Int]
kk19 = h2b "0fc19dc6"
kk20 :: [Int]
kk20 = h2b "240ca1cc"
kk21 :: [Int]
kk21 = h2b "2de92c6f"
kk22 :: [Int]
kk22 = h2b "4a7484aa"
kk23 :: [Int]
kk23 = h2b "5cb0a9dc"
kk24 :: [Int]
kk24 = h2b "76f988da"
kk25 :: [Int]
kk25 = h2b "983e5152"
kk26 :: [Int]
kk26 = h2b "a831c66d"
kk27 :: [Int]
kk27 = h2b "b00327c8"
kk28 :: [Int]
kk28 = h2b "bf597fc7"
kk29 :: [Int]
kk29 = h2b "c6e00bf3"
kk30 :: [Int]
kk30 = h2b "d5a79147"
kk31 :: [Int]
kk31 = h2b "06ca6351"
kk32 :: [Int]
kk32 = h2b "14292967"
kk33 :: [Int]
kk33 = h2b "27b70a85"
kk34 :: [Int]
kk34 = h2b "2e1b2138"
kk35 :: [Int]
kk35 = h2b "4d2c6dfc"
kk36 :: [Int]
kk36 = h2b "53380d13"
kk37 :: [Int]
kk37 = h2b "650a7354"
kk38 :: [Int]
kk38 = h2b "766a0abb"
kk39 :: [Int]
kk39 = h2b "81c2c92e"
kk40 :: [Int]
kk40 = h2b "92722c85"
kk41 :: [Int]
kk41 = h2b "a2bfe8a1"
kk42 :: [Int]
kk42 = h2b "a81a664b"
kk43 :: [Int]
kk43 = h2b "c24b8b70"
kk44 :: [Int]
kk44 = h2b "c76c51a3"
kk45 :: [Int]
kk45 = h2b "d192e819"
kk46 :: [Int]
kk46 = h2b "d6990624"
kk47 :: [Int]
kk47 = h2b "f40e3585"
kk48 :: [Int]
kk48 = h2b "106aa070"
kk49 :: [Int]
kk49 = h2b "19a4c116"
kk50 :: [Int]
kk50 = h2b "1e376c08"
kk51 :: [Int]
kk51 = h2b "2748774c"
kk52 :: [Int]
kk52 = h2b "34b0bcb5"
kk53 :: [Int]
kk53 = h2b "391c0cb3"
kk54 :: [Int]
kk54 = h2b "4ed8aa4a"
kk55 :: [Int]
kk55 = h2b "5b9cca4f"
kk56 :: [Int]
kk56 = h2b "682e6ff3"
kk57 :: [Int]
kk57 = h2b "748f82ee"
kk58 :: [Int]
kk58 = h2b "78a5636f"
kk59 :: [Int]
kk59 = h2b "84c87814"
kk60 :: [Int]
kk60 = h2b "8cc70208"
kk61 :: [Int]
kk61 = h2b "90befffa"
kk62 :: [Int]
kk62 = h2b "a4506ceb"
kk63 :: [Int]
kk63 = h2b "bef9a3f7"
kk64 :: [Int]
kk64 = h2b "c67178f2"

ks :: [[Int]]
ks =  [kk1]  ++ [kk2]  ++ [kk3]  ++ [kk4]  ++ [kk5]  ++ [kk6]  ++ [kk7]  ++ [kk8]  ++ [kk9]  ++ [kk10] ++
      [kk11] ++ [kk12] ++ [kk13] ++ [kk14] ++ [kk15] ++ [kk16] ++ [kk17] ++ [kk18] ++ [kk19] ++ [kk20] ++
      [kk21] ++ [kk22] ++ [kk23] ++ [kk24] ++ [kk25] ++ [kk26] ++ [kk27] ++ [kk28] ++ [kk29] ++ [kk30] ++
      [kk31] ++ [kk32] ++ [kk33] ++ [kk34] ++ [kk35] ++ [kk36] ++ [kk37] ++ [kk38] ++ [kk39] ++ [kk40] ++
      [kk41] ++ [kk42] ++ [kk43] ++ [kk44] ++ [kk45] ++ [kk46] ++ [kk47] ++ [kk48] ++ [kk49] ++ [kk50] ++
      [kk51] ++ [kk52] ++ [kk53] ++ [kk54] ++ [kk55] ++ [kk56] ++ [kk57] ++ [kk58] ++ [kk59] ++ [kk60] ++
      [kk61] ++ [kk62] ++ [kk63] ++ [kk64]
      
k0 :: [[Int]]
k0 = ks ++ [[0]]
