module Exercises where

-- 3.Correct the syntax errors.
n :: Int
n = a `div` length xs
  where
    a = 10
    xs = [1,2,3,4,5]

-- 4. Give some alternative definitions for the library function `last`

-- With other functions
last1 :: [a] -> a
last1 xs = head $ drop (length xs - 1) xs

-- With recursion
last2 :: [a] -> a
last2 [x] = x
last2 (_:xs) = last2 xs

-- 5. Give 2 alternative definitions for `init`.
init1 :: [a] -> [a]
init1 xs = reverse $ drop 1 $ reverse xs

init2 :: [a] -> [a]
init2 [x] = []
init2 (x:xs) = x : init2 xs
