module Kyu6.ExclamationMarksSeries17 where

import Prelude hiding (Either(..))

data Comparison = Left | Right | Balance deriving (Show, Eq, Enum, Bounded)

balance :: String -> String -> Comparison
balance left right =
  case compare (getBalance left) (getBalance right) of
    LT -> Right
    GT -> Left
    EQ -> Balance

count :: Eq a => a -> [a] -> Int
count x = length . filter (==x)

getBalance :: String -> Int
getBalance xs = count '?' xs * 3 + count '!' xs * 2
