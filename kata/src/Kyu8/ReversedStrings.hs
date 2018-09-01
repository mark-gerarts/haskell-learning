module Kyu8.ReversedStrings where

-- https://www.codewars.com/kata/5168bb5dfe9a00b126000018/train/haskell

solution :: String -> String
solution [] = []
solution (x:xs) = solution xs ++ [x]
