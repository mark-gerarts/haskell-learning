module TautologyChecker where

import Data.List (nub)

data Prop = Const Bool
          | Var Char
          | Not Prop
          | And Prop Prop
          | Or Prop Prop -- Logical disjunction
          | Imply Prop Prop
          | Eq Prop Prop

type Assoc k v = [(k, v)]

type Subst = Assoc Char Bool

type Bit = Int

find :: Eq k => k -> Assoc k v -> v
find k t = head [v | (k', v) <- t, k == k']

eval :: Subst -> Prop -> Bool
eval _ (Const b) = b
eval s (Var x) = find x s
eval s (Not p) = not (eval s p)
eval s (And p q) = eval s p && eval s q
eval s (Or p q) = eval s p || eval s q
eval s (Imply p q) = eval s p <= eval s q
eval s (Eq p q) = eval s (Imply p q) && eval s (Imply q p)

vars :: Prop -> [Char]
vars (Const _) = []
vars (Var x) = [x]
vars (Not p) = vars p
vars (And p q) = vars p ++ vars q
vars (Or p q) = vars p ++ vars q
vars (Imply p q) = vars p ++ vars q
vars (Eq p q) = vars p ++ vars q

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

bools :: Int -> [[Bool]]
bools 0 = [[]]
bools n = map (False:) bss ++ map (True:) bss
  where
    bss = bools (n-1)

substs :: Prop -> [Subst]
substs p = map (zip vs) (bools (length vs))
  where
    vs = nub (vars p)

isTaut :: Prop -> Bool
isTaut p = and [eval s p | s <- substs p]

p1 :: Prop
p1 = And (Var 'A') (Not (Var 'A'))

p2 :: Prop
p2 = Imply (And (Var 'A') (Var 'B')) (Var 'A')

p3 :: Prop
p3 = Imply (Var 'A') (And (Var 'A') (Var 'B'))

p4 :: Prop
p4 = Imply (And (Var 'A') (Imply (Var 'A') (Var 'B'))) (Var 'B')

p5 :: Prop
p5 = Or (Var 'A') (Not (Var 'A'))

p6 :: Prop
p6 = Eq (Var 'A') (Var 'A')
