module Kyu6.TortoiseRacing where

-- https://www.codewars.com/kata/55e2adece53b4cdcb900006c/train/haskell
race :: Int -> Int -> Int -> Maybe (Int, Int, Int)
race v1 v2 g
  | v2 <= v1 = Nothing
  | otherwise = Just (parseSeconds $ raceInSeconds v1 v2 g)

raceInSeconds :: Int -> Int -> Int -> Int
raceInSeconds v1 v2 g = floor $ (* 3600) hours
  where
    hours = (fromIntegral g :: Double) / fromIntegral (v2 - v1)

parseSeconds :: Int -> (Int, Int, Int)
parseSeconds totalSeconds = (h, m, s)
  where
    (h, s1) = totalSeconds `divMod` 3600
    (m, s) = s1 `divMod` 60
