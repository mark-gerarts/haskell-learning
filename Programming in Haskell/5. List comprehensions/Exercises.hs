module Exercises where

-- 1. Calculate the sum of the first 100 integer squares using a list
--    comprhension.
sumFirst100Squares :: Integer
sumFirst100Squares = sum [x^2 | x <- [1..100]]

-- 2. Create a representation of a grid using a list comprehension.
grid :: Int -> Int -> [(Int,Int)]
grid w h = [(x,y) | x <- [0..w], y <- [0..h]]

-- 3. Using `grid`, create a function that returns the coordinate square, but
--    excluding the diagonal from (0,0) to (n,n).
squareGrid :: Int -> [(Int, Int)]
squareGrid n = [(x,y) | (x,y) <- grid n n, x /= y]

-- 4. Replicate the library function `replicate` using a list comprehension.
replicate' :: Int -> a -> [a]
replicate' n x = [x | _ <- [1..n]]

-- 5. Create a function `pyths` that returns a list of Pythagorean integer
--    triples whose comoponents are at most a given limit.
pyths :: Int -> [(Int,Int,Int)]
pyths n = [(a,b,c) | a <- [1..n], b <- [1..n], c <- [1..n], a^2 + b^2 == c^2]

-- 6. Create a function `perfects` that lists all perfect integers up to a given
--    limit.
factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

isPerfect :: Int -> Bool
isPerfect x = (sum . init . factors) x == x

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], isPerfect x]

-- 7. Rewrite the list comprehension.
comprehension = [(x,y) | x <- [1,2], y <- [3,4]]
rework = concat [[(x,y) | y <- [3,4]] | x <- [1,2]]

-- 8. Redifine the funciton `positions`
find :: Eq a => a -> [(a,b)] -> [b]
find k t = [v | (k',v) <- t, k == k']

positions :: Eq a => a -> [a] -> [Int]
positions x xs = find x (zip xs [0..])

-- 9. Define a function that calculates the scalar product of two vectors.
scalarproduct :: [Int] -> [Int] -> Int
scalarproduct xs ys = sum [x * y | (x,y) <- zip xs ys]
