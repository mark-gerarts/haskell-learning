module Aoc.D02a where

import Data.List

main :: IO ()
main = do
  s <- readFile "D02input.txt"
  print $ checksum $ map (toInts . words) $ lines s

toInts :: [String] -> [Int]
toInts = map read

lineDiff :: [Int] -> Int
lineDiff xs = max - min
  where
    sorted = sort xs
    min = head sorted
    max = last sorted

checksum :: [[Int]] -> Int
checksum = sum . map lineDiff
