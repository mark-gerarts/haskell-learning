module Exercises where

-- 1. Defina a function `halve` that splits even-lengthed lists in two halves.
halve :: [a] -> ([a], [a])
halve xs = (take half xs, drop half xs)
  where
    half = length xs `div` 2

-- 2. Define a function `third` that returns the third element in a list, using
-- 2.a `head` and `tail`
third1 :: [a] -> a
third1 xs = head $ tail $ tail xs

-- 2.b list indexing `!!`
third2 :: [a] -> a
third2 xs = xs !! 2

-- 2.c pattern matching
third3 :: [a] -> a
third3 (_:_:x:_) = x

-- 3. Create a function `safetail` that acts the same way as `tail`, except
--    that it maps the empty list to itself rather than throwing an error.
-- 3.a conditional expression
safetail1 :: [a] -> [a]
safetail1 xs =
  if null xs
    then []
    else tail xs

-- 3.b guarded equations
safetail2 :: [a] -> [a]
safetail2 xs
  | null xs = []
  | otherwise = tail xs

-- 3.c pattern matching
safetail3 :: [a] -> [a]
safetail3 [] = []
safetail3 xs = tail xs

-- 4. Define `||` in four different ways using pattern matching.
(||~) :: Bool -> Bool -> Bool
True ||~ True = True
True ||~ False = True
False ||~ True = True
False ||~ False = False

(||@) :: Bool -> Bool -> Bool
False ||@ False = False
_ ||@ _ = True

(||#) :: Bool -> Bool -> Bool
False ||# b = b
True ||# _ = True

(||$) :: Bool -> Bool -> Bool
b ||$ c
  | b == c = b
  | otherwise = True

-- 5. Formalise `&&` using conditional expressions.
(&&*) :: Bool -> Bool -> Bool
(&&*) a b =
  if a == True && b == True
    then True
    else if a == True
           then True
           else b

-- 6. Do the same for the alternative definition.
(&&**) :: Bool -> Bool -> Bool
(&&**) a b =
  if a == True
    then b
    else False

-- 7. Formalise currying using lambda's for the given expression.
mult :: Int -> (Int -> (Int -> Int))
mult = \x -> (\y -> (\z -> x * y * z))

-- 8. Define a function implementing `luhnDouble` and use it to create a
--    function that applies Luhn's algorithm to a 4-digit number.
luhnDouble :: Int -> Int
luhnDouble x
  | x' > 9 = x' - 9
  | otherwise = x'
  where
    x' = x * 2

luhn :: Int -> Int -> Int -> Int -> Bool
luhn a b c d = sum ((map luhnDouble [a,c]) ++ [b,d]) `mod` 10 == 0
