module Kyu7.LeetSpeak where

import Data.List

-- https://www.codewars.com/kata/toleetspeak/train/haskell
toLeetSpeak :: String -> String
toLeetSpeak = map charToLeetSpeak

charToLeetSpeak :: Char -> Char
charToLeetSpeak c =
  case find (\(index, _) -> index == c) mapping of
    Just (_, value) -> value
    Nothing -> c

mapping :: [(Char, Char)]
mapping =
  [ ('A', '@')
  , ('B', '8')
  , ('C', '(')
  , ('D', 'D')
  , ('E', '3')
  , ('F', 'F')
  , ('G', '6')
  , ('H', '#')
  , ('I', '!')
  , ('J', 'J')
  , ('K', 'K')
  , ('L', '1')
  , ('M', 'M')
  , ('N', 'N')
  , ('O', '0')
  , ('P', 'P')
  , ('Q', 'Q')
  , ('R', 'R')
  , ('S', '$')
  , ('T', '7')
  , ('U', 'U')
  , ('V', 'V')
  , ('W', 'W')
  , ('X', 'X')
  , ('Y', 'Y')
  , ('Z', '2')
  ]
