module P6SumSquareDifference where

sumOfSquares :: Int -> Int
sumOfSquares n = sum $ map (^2) [1..n]

squareOfSum :: Int -> Int
squareOfSum n = sum [1..n] ^ 2

sumSquareDifference :: Int -> Int
sumSquareDifference n = (squareOfSum n) - (sumOfSquares n)
