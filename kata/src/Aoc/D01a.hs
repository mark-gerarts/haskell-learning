module Aoc.D01a where

import Data.Char

sumNext :: [Int] -> Int
sumNext xs = sum [x | (x,y) <- zip xs (tail (cycle xs)), x == y]

str2digits :: String -> [Int]
str2digits = map digitToInt

solve :: String -> Int
solve = sumNext . str2digits
