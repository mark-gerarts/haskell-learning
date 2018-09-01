module Kyu7.XO where

import Data.Char

-- https://www.codewars.com/kata/exes-and-ohs/train/haskell
xo :: String -> Bool
xo xs = countOccurences 'X' xsUpper == countOccurences 'O' xsUpper
  where xsUpper = map toUpper xs

countOccurences :: Eq a => a -> [a] -> Int
countOccurences x = length . filter (==x)
