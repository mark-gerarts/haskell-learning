module Kyu7.ShortestWord where

-- https://www.codewars.com/kata/shortest-word/train/haskell
find_shortest :: String -> Integer
find_shortest = toInteger . minimum . map length . words
