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

-- 6.d `!!`
(!!:) :: [a] -> Int -> a
(!!:) (x:_) 0 = x
(!!:) (_:xs) n = (!!:) xs (n-1)

-- 6.e `elem`
elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' x' (x:xs) = (x' == x) || elem' x' xs

-- 7. Define a function `merge` that merges two lists into a single, sorted
--    list.
merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) | x <= y = x : merge xs (y:ys)
                    | otherwise = y : merge (x:xs) ys

-- 8. Using merge, implement a merge sort algorithm.
halve :: [a] -> ([a], [a])
halve xs = (take n xs, drop n xs)
  where
    n = length xs `div` 2

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort ys) (msort zs)
  where
    (ys, zs) = halve xs

-- 9. Define a few more library functions using the 5-step process.
-- 9.a `sum`
sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = x + sum' xs

-- 9.b `take`
take' :: Int -> [a] -> [a]
take' 0 _ = []
take' _ [] = []
take' n (x:xs) = x : take' (n - 1) xs

-- 9.c `last`
last' :: [a] -> a
last' [] = error "Getting last element of empty list"
last' [x] = x
last' (_:xs) = last' xs
