module Kyu5.ZooDisaster where

import Data.List.Split
import Data.List
import Prelude hiding (Nothing)

type Animal = String
data Action = Nothing | Eating Animal Animal deriving (Eq)

instance Show Action where
  show Nothing = "Nothing gets eaten"
  show (Eating a b) = a ++ " eats " ++ b

whoEatsWho :: String -> [String]
whoEatsWho input = input : map show actions ++ [intercalate "," remaining]
  where
    animals = splitOn "," input
    (remaining, actions) = collectActions animals []

testInput :: String
testInput = "bear,big-fish,lion,cow,bug,leaves"

collectActions :: [Animal] -> [Action] -> ([Animal], [Action])
collectActions animals actions =
  case action of
    Nothing -> (remaining, actions)
    _ -> collectActions remaining (actions ++ [action])
  where
    (remaining, action) = performAction animals

performAction :: [Animal] -> ([Animal], Action)
performAction (a:b:c:as)
  | a `canEat` b = (a:c:as, Eating a b)
  | b `canEat` a = (b:c:as, Eating b a)
  | b `canEat` c = (a:b:as, Eating b c)
  | otherwise = (a:list, action)
    where
      (list, action) = performAction (b:c:as)
performAction (a:b:as)
  | a `canEat` b = (a:as, Eating a b)
  | b `canEat` a = (b:as, Eating b a)
performAction as = (as, Nothing)

canEat :: Animal -> Animal -> Bool
canEat a b = b `elem` foodList a

foodList :: Animal -> [Animal]
foodList "antelope" = ["grass"]
foodList "big-fish" = ["little-fish"]
foodList "bug" = ["leaves"]
foodList "bear" = ["big-fish", "bug", "chicken", "cow", "leaves", "sheep"]
foodList "chicken" = ["bug"]
foodList "cow" =  ["grass"]
foodList "fox" = ["chicken", "sheep"]
foodList "giraffe" = ["leaves"]
foodList "lion" = ["antelope", "cow"]
foodList "panda" = ["leaves"]
foodList "sheep" =  ["grass"]
foodList _ = []
