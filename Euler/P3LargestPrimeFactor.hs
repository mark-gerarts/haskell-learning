module P3LargestPrimeFactor where

getPrimeFactors :: Int -> [Int]
getPrimeFactors 1 = []
getPrimeFactors n
  | null factors = [n]
  | otherwise = factors ++ getPrimeFactors (n `div` head factors)
  where
    factors = take 1 $ filter (\x -> n `mod` x == 0) [2..n-1]

getGreatesPrimeFactor :: Int -> Int
getGreatesPrimeFactor = last . getPrimeFactors
