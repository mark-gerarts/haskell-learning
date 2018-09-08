module Kyu6.SortTheOdd where

import Data.List

-- https://www.codewars.com/kata/578aa45ee9fd15ff4600090d/train/haskell
sortArray :: [Int] -> [Int]
sortArray xs = undefined
  where
    indexed = zipWithIndex xs
    filterIndexedList f = filter (\(_, x) -> f x)
    odds = sort $ map fst $ filterIndexedList odd indexed
    evens = filterIndexedList even indexed

zipWithIndex :: [a] -> [(Int, a)]
zipWithIndex = zip [0..]

insertAt :: [a] -> a -> Int -> [a]
insertAt xs x i = take i xs ++ [x] ++ drop i xs
