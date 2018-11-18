module Aoc.D02b where

import Data.Char

sumNext :: [Int] -> Int
sumNext xs = sum [x | (x,y) <- zip xs (drop (length xs `div` 2) (cycle xs)), x == y]

str2digits :: String -> [Int]
str2digits = map digitToInt

solve :: String -> Int
solve = sumNext . str2digits
