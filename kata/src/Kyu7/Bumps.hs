module Bumps where

bump :: String -> String
bump s | (length . filter (=='n')) s <= 15 = "Woohoo!"
       | otherwise = "Car Dead"
