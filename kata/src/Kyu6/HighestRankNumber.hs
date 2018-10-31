module Kyu6.HighestRankNumber where

import qualified Data.Map.Strict as Map

highestRank :: Ord c => [c] -> c
highestRank = fst . highestFrequency . Map.toList . getFrequencyMap

highestFrequency :: (Ord a, Ord b) => [(a, b)] -> (a, b)
highestFrequency = foldl1 highest
  where
    highest (xh, fh) (x, f)
      | f >= fh && x > xh = (x, f)
      | otherwise = (xh, fh)

getFrequencyMap :: Ord c => [c] -> Map.Map c Int
getFrequencyMap = foldl (\m x -> Map.insertWith incIfExists x 1 m) Map.empty
  where
    incIfExists _ old = old + 1
