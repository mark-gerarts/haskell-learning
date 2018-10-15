module Queue where

type Queue a = [a]

enqueue :: a -> Queue a -> Queue a
enqueue x q = x : q

dequeue :: Queue a -> (Maybe a, Queue a)
dequeue [] = (Nothing, [])
dequeue q = (Just (head q), tail q)

first :: Queue a -> Maybe a
first [] = Nothing
first q = Just (head q)

isEmpty :: Queue a -> Bool
isEmpty [] = True
isEmpty _ = False

size :: Queue a -> Int
size = length
