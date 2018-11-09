module Kyu6.BouncingBalls where

-- https://www.codewars.com/kata/bouncing-balls/train/haskell
bouncingBall :: Double -> Double -> Double -> Integer
bouncingBall h bounce window
  | valid = calculate h bounce window
  | otherwise = -1
  where
    valid = h > 0 && bounce > 0 && bounce < 1 && window < h

calculate :: Double -> Double -> Double -> Integer
calculate h bounce window
  | h < window = 0
  | newHeight < window = 1
  | otherwise = 2 + calculate newHeight bounce window
  where
    newHeight = h * bounce
