module Kyu4.StringsMix where

import Data.Char
import Data.List
import Data.Ord

-- https://www.codewars.com/kata/strings-mix/train/haskell
mix :: [Char] -> [Char] -> [Char]
mix s1 s2 = undefined

getOccurenceList :: String -> [(Char, Int)]
getOccurenceList = sortOn (Down . snd) . mapToOccurences

mapToOccurences :: String -> [(Char, Int)]
mapToOccurences s =
  [(c, n) | c <- nub onlyLower, let n = countOccurences c onlyLower, n > 1]
  where
    onlyLower = filter isAsciiLower s

countOccurences :: Eq a => a -> [a] -> Int
countOccurences x xs = length $ elemIndices x xs

testMix :: String
testMix = mix "Are they here" "yes, they are here"
