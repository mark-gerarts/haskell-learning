module Aoc.D02a where

import Data.List

main :: IO ()
main = do
  s <- readFile "D02input.txt"
  print $ checksum $ map (toInts . words) $ lines s

toInts :: [String] -> [Int]
toInts = map read

lineDiff :: [Int] -> Int
lineDiff xs = a `div` b
  where
    (a,b) = head [(a,b) | a <- xs, b <- xs, a /= b, a `mod` b == 0]

checksum :: [[Int]] -> Int
checksum = sum . map lineDiff
