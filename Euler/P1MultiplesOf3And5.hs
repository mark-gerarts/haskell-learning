module P1MultiplesOf3And5 where

-- Find the sum of all the multiples of 3 or 5 below 1000.
multiplesOf :: Int -> [Int]
multiplesOf n = [x * n | x <- [1 ..]]

sumOfMultiplesBelow :: Int -> Int
sumOfMultiplesBelow x = sumMultiplesOf 3 + sumMultiplesOf 5 - sumMultiplesOf 15
  where
    sumMultiplesOf n = sum $ takeWhile (< x) (multiplesOf n)
