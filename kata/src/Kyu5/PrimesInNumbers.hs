module Kyu5.PrimesInNumbers where

import Data.List

prime_factors :: Int -> String
prime_factors = prettyPrint . getPrimeFactors

getPrimeFactors :: Int -> [Int]
getPrimeFactors n =
  case factors of
    [] -> [n]
    _  -> factors ++ getPrimeFactors (n `div` head factors)
  where
    squareRoot = (round . sqrt . fromIntegral) n
    factors = take 1 $ filter (\x -> (n `mod` x) == 0) [2 .. squareRoot]

prettyPrint :: [Int] -> String
prettyPrint xs = concatMap printTuple counts
  where
    counts = map (\x -> (x, countElem x xs)) (nub xs)
    printTuple (pk, nk)
      | nk == 1 = "(" ++ show pk ++ ")"
      | otherwise = "(" ++ show pk ++ "**" ++ show nk ++ ")"

countElem :: Eq a => a -> [a] -> Int
countElem x = length . filter (==x)
