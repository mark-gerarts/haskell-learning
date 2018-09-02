module Kyu7.Isogram where

import Data.List
import Data.Char

-- https://www.codewars.com/kata/54ba84be607a92aa900000f1/train/haskell
isIsogram :: String -> Bool
isIsogram xs = sortedList == nub sortedList
  where
    sortedList = (sort . map toUpper) xs
