module Kyu7.MaxDiffLength where

-- https://www.codewars.com/kata/5663f5305102699bad000056/train/haskell
mxdiflg :: [String] -> [String] -> Maybe Int
mxdiflg s1 s2 =
  if null s1 || null s2
    then Nothing
    else Just $ maximum [max2 - min1, max1 - min2]
  where
    (min1, max1) = getExtrema . mapToLength $ s1
    (min2, max2) = getExtrema . mapToLength $ s2

getExtrema :: Ord a => [a] -> (a, a)
getExtrema xs = (minimum xs, maximum xs)

mapToLength :: [[a]] -> [Int]
mapToLength = map length
