module Kyu5.Rot13 where

import Data.Char
import Data.List

-- https://www.codewars.com/kata/530e15517bc88ac656000716/train/haskell
rot13 :: String -> String
rot13 = map rot13char

rot13char :: Char -> Char
rot13char c =
  case elemIndex (toLower c) ['a' .. 'z'] of
    Just i ->
      let rotatedC = take 26 (drop 13 $ cycle ['a' .. 'z']) !! i
       in if isLower c
            then rotatedC
            else toUpper rotatedC
    Nothing -> c
