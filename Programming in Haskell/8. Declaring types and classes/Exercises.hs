module Exercises where

-- 1. Define a recursive function `mult` for natural numbers.

-- First we define some utility functions that were discussed in the book.
data Nat = Zero | Succ Nat

instance Show Nat where
  show x = show (nat2int x) ++ "N"

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat x = Succ (int2nat (x - 1))

nat2int :: Nat -> Int
nat2int Zero = 0
nat2int (Succ x) = 1 + nat2int x

add :: Nat -> Nat -> Nat
add Zero n = n
add (Succ m) n = Succ (add m n)

-- The actual implementation
mult :: Nat -> Nat -> Nat
mult Zero _ = Zero
mult _ Zero = Zero
mult (Succ m) n = add n (mult m n)

-- 2. Redefine `occurs` using Orderings.
data Tree a = Leaf a | Node (Tree a) a (Tree a)

occurs :: Ord a => a -> Tree a -> Bool
occurs x (Leaf el) = x == el
occurs x (Node left el right) = case compare x el of
                                  EQ -> True
                                  LT -> occurs x left
                                  GT -> occurs x right

-- 3. Define a function to check if a tree is balanced, using a slightly
--    different definition.
data Tree' a = Leaf' a | Node' (Tree' a) (Tree' a)

numLeaves :: Tree' a -> Int
numLeaves (Leaf' _) = 1
numLeaves (Node' left right) = numLeaves left + numLeaves right

isBalanced :: Tree' a -> Bool
isBalanced (Leaf' _) = True
isBalanced (Node' left right) = abs (numLeaves left - numLeaves right) <= 1

-- 4. Define a function `balance`, which converts a list into a balanced tree.
split :: [a] -> ([a], [a])
split xs = (take l xs, drop l xs)
  where
    l = length xs `div` 2

balance :: [a] -> Tree' a
balance [x] = Leaf' x
balance xs = Node' (balance left) (balance right)
  where
    (left, right) = split xs

-- 5. Define `folde`
data Expr = Val Int | Add Expr Expr

folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
folde f _ (Val x) = f x
folde f g (Add x y) = g (folde f g x) (folde f g y)

-- 6. Define an `eval` function using `folde`, as well as a `size` function,
--    which calculates the number of values.
eval :: Expr -> Int
eval = folde id (+)

size :: Expr -> Int
size = folde (const 1) (+)

-- 7. Complete the following instance declarations.
-- instance Eq a => Eq (Maybe a) where
--   Nothing == Nothing = True
--   Just x == Just y = x == y
--   _ == _ = False

-- instance Eq a => Eq [a] where
--   [] == [] = True
--   (x:xs) == (y:ys) = x == y && xs == ys

-- 8. Extend the tautology checker to suppor disjuntion and equivalence.
-- See TautologyChecker.hs

-- 9. Extend the abstract machine to support multiplication
-- See AbstractMachine.hs
