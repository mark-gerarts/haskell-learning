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
