module BinaryStringTransmitter where

import Data.Char

type Bit = Int

bin2int :: [Bit] -> Int
bin2int = foldr (\x y -> x + 2 * y) 0

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)

encode :: String -> [Bit]
encode = concatMap (addParityBit . make8 . int2bin . ord)

addParityBit :: [Bit] -> [Bit]
addParityBit bits = bits ++ [sum bits `mod` 2]

chopN :: Int -> [Bit] -> [[Bit]]
chopN _ [] = []
chopN n bits = take n bits : chopN n (drop n bits)

chop8 :: [Bit] -> [[Bit]]
chop8 = chopN 8

chop9 :: [Bit] -> [[Bit]]
chop9 = chopN 9

decode :: [Bit] -> String
decode = map (chr . bin2int . checkParity) . chop9

checkParity :: [Bit] -> [Bit]
checkParity bits | even $ sum bits = take 8 bits
                 | otherwise = error "Parity error detected"

transmit :: String -> String
transmit = decode . channel . encode

channel :: [Bit] -> [Bit]
channel = id

faultyChannel :: [Bit] -> [Bit]
faultyChannel = tail
