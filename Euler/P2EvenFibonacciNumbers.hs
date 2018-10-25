module P2EvenFibonacciNumbers where

fibs :: Int -> Int -> [Int]
fibs a b = a : fibs b (a+b)

sumEvenFibs :: Int
sumEvenFibs = sum $ takeWhile (<=4000000) $ filter even (fibs 1 2)
