module UPCCheckDigits where

import Data.Char

sample :: String
sample = "042100005264"

getCheckDigit :: String -> Int
getCheckDigit input = if m == 0 then 0 else 10 - m
  where
    digits = map digitToInt input
    odds = [x | (i, x) <- zip [1..] digits, odd i]
    evens = [x | (i, x) <- zip [1..] digits, even i]
    m = (sum odds * 3 + sum evens) `mod` 10


stringToDigits :: String -> [Int]
stringToDigits = map digitToInt
