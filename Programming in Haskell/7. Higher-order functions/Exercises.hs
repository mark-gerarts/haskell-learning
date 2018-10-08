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
takeWhile' p (x:xs)
  | p x = x : takeWhile' p xs
  | otherwise = []

-- 2.d `dropWhile`
dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' _ [] = []
dropWhile' p (x:xs)
  | p x = dropWhile' p xs
  | otherwise = xs

-- 3. Redefine `map` and `filter` using `foldr`
map' :: (a -> b) -> [a] -> [b]
map' f = foldr (\x y -> f x : y) []

filter' :: (a -> Bool) -> [a] -> [a]
filter' p =
  foldr
    (\x y ->
       if p x
         then x : y
         else y)
    []

-- 4. Define a function `dec2int` that converts a decimal number to an integer,
--    using `foldl`
dec2int :: [Int] -> Int
dec2int = foldl (\x y -> 10 * x + y) 0

-- 5. Define the functions `curry` and `uncurry`
curry' :: ((a, b) -> c) -> (a -> b -> c)
curry' f = \x y -> f (x, y)

uncurry' :: (a -> b -> c) -> ((a, b) -> c)
uncurry' f = \(x, y) -> f x y

-- 6. Redefine a few functions using the newly learned `unfold`
unfold p h t x
  | p x = []
  | otherwise = h x : unfold p h t (t x)

type Bit = Int

chop8 :: [Bit] -> [[Bit]]
chop8 = unfold null (take 8) (drop 8)

map'' :: (a -> b) -> [a] -> [b]
map'' f = unfold null (f . head) tail

iterate' :: (a -> a) -> a -> [a]
iterate' f = unfold (\_ -> False) id f

-- 7. Modify the binary string transmitter to detect transmission errors.
--    See BinaryStringTransmitter
-- 8. See 7.
-- 9. Define `altmap`, that alternately applies 2 functions to a list
altMap :: (a -> b) -> (a -> b) -> [a] -> [b]
altMap _ _ [] = []
altMap f g (x:xs) = f x : altMap g f xs

-- 10. Use altmap to implement Luhn's algorithm for numbers of any length.
luhnDouble :: Int -> Int
luhnDouble x
  | x' > 9 = x' - 9
  | otherwise = x'
  where
    x' = x * 2

luhn :: Int -> Bool
luhn x = sum luhnDoubles `mod` 10 == 0
  where
    digits = reverse $ splitInt x
    luhnDoubles = altMap id luhnDouble digits

splitInt :: Int -> [Int]
splitInt 0 = []
splitInt x = splitInt (x `div` 10) ++ [x `mod` 10]
