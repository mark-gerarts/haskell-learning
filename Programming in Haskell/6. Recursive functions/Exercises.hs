module Exercises where

-- 1. Modify `fac` to prohibit negative input.
fac :: Int -> Int
fac 0 = 1
fac n | n > 0 = n * fac (n-1)
      | otherwise = error "Negative input is not allowed"

-- 2. Define the `sumdown` function
sumdown :: Int -> Int
sumdown 0 = 0
sumdown n = n + sumdown (n - 1)

-- 3. Define the `^` operator using recursion.
(^:) :: Int -> Int -> Int
(^:) _ 0 = 1
(^:) x n = x * (x ^: (n-1))

-- 4. Using recursion, implement Euclid's algorithm.
euclid :: Int -> Int -> Int
euclid x y | x == y = x
           | x < y = euclid x (y - x)
           | otherwise = euclid (x - y) x

-- 6. Implement a few library functions using recursion.
-- 6.a `and`
and' :: [Bool] -> Bool
and' [] = True
and' (x:xs) = x && and' xs

-- 6.b `concat`
concat' :: [[a]] -> [a]
concat' [] = []
concat' (xs:xss) = xs ++ concat' xss

-- 6.c `replicate`
replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n x = x : replicate' (n-1) x
