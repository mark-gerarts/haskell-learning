module Kyu6.MultiTapTextEntry where

import Data.List
import Data.Char (toUpper)

presses :: String -> Int
presses = sum . map (keypressesForChar . toUpper)

-- Hardcoding the keypresses is discouraged, so we'll recreate a keyboard
-- layout.
keyboard :: [String]
keyboard =
  [ "1",     "ABC2", "DEF3"
  , "GHI4",  "JKL5", "MNO6"
  , "PQRS7", "TUV8", "WXYZ9"
  , "",      " 0",   ""
  ]

keypressesForChar :: Char -> Int
keypressesForChar c =
  case find (elem c) keyboard >>= elemIndex c of
    Nothing -> 0
    Just x -> x + 1
