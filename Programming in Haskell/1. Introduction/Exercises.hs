module Exercises where

-- Chapter 1: Introduction
-- 3. Define a function product that produces the product of a list of numbers
product :: [Int] -> Int
product = foldl1 (*)

-- 4. How can qsort be altered such that it produces a reverse sorted list?
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort larger ++ [x] ++ qsort smaller
  where
    smaller = [a | a <- xs, a <= x]
    larger = [b | b <- xs, b > x]
