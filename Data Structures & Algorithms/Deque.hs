module Deque where

import Prelude hiding (last)
import qualified Prelude (last)

type Deque a = [a]

addFirst :: a -> Deque a -> Deque a
addFirst = (:)

addLast :: a -> Deque a -> Deque a
addLast x d = d ++ [x]

removeFirst :: Deque a -> (Maybe a, Deque a)
removeFirst [] = (Nothing, [])
removeFirst d = (first d, tail d)

removeLast :: Deque a -> (Maybe a, Deque a)
removeLast [] = (Nothing, [])
removeLast d = (last d, init d)

first :: Deque a -> Maybe a
first [] = Nothing
first d = Just (Prelude.head d)

last :: Deque a -> Maybe a
last [] = Nothing
last d = Just (Prelude.last d)

size :: Deque a -> Int
size = length

isEmpty :: Deque a -> Bool
isEmpty [] = True
isEmpty _ = False
