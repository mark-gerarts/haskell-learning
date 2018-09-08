module Kyu6.TortoiseRacing where

-- https://www.codewars.com/kata/55e2adece53b4cdcb900006c/train/haskell
race :: Int -> Int -> Int -> Maybe (Int, Int, Int)
race v1 v2 g
  | v2 < v1 = Nothing
  | otherwise = Just (parseSeconds $ raceInSeconds v1 v2 g)

raceInSeconds :: Int -> Int -> Int -> Int
raceInSeconds v1 v2 g = g `quot` (v2 - v1)

parseSeconds :: Int -> (Int, Int, Int)
parseSeconds totalSeconds = (hours, minutes, seconds)
  where
    hours = totalSeconds `div` 3600
    minutes = (totalSeconds - (hours * 3600)) `div` 60
    seconds = totalSeconds - (hours * 3600) - (minutes * 60)
