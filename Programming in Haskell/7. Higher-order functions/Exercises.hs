module Exercises where

-- 1. Re-express `[f x | x <- xs, p x]` using `map` and `filter`
listComprehension :: (a -> b) -> (a -> Bool) -> [a] -> [b]
listComprehension f p = map f . filter p

-- 2. Redefine some library functions
-- 2.a `all`
all' :: (a -> Bool) -> [a] -> Bool
all' p = and . map p

-- 2.b `any`
any' :: (a -> Bool) -> [a] -> Bool
any' p = or . map p

-- 2.c `takeWhile`
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' p (x:xs) | p x = x : takeWhile' p xs
                    | otherwise = []

-- 2.d `dropWhile`
dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' _ [] = []
dropWhile' p (x:xs) | p x = dropWhile' p xs
                    | otherwise = xs

-- 3. Redefine `map` and `filter` using `foldr`
map' :: (a -> b) -> [a] -> [b]
map' f = foldr (\x y -> f x : y) []

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x y -> if p x then x : y else y) []

-- 4. Define a function `dec2int` that converts a decimal number to an integer,
--    using `foldl`
dec2int :: [Int] -> Int
dec2int = foldl (\x y -> 10 * x + y) 0

-- 5. Define the functions `curry` and `uncurry`
curry' :: ((a, b) -> c) -> (a -> b -> c)
curry' f = \x y -> f (x, y)

uncurry' :: (a -> b -> c) -> ((a, b) -> c)
uncurry' f  = \(x, y) -> f x y

-- 6. Redefine a few functions using the newly learned `unfold`
unfold p h t x | p x = []
               | otherwise = h x : unfold p h t (t x)

type Bit = Int

chop8 :: [Bit] -> String
chop8 = undefined
