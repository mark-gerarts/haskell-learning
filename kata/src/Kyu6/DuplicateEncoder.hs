module DuplicateEncoder where

import Data.Char

duplicateEncode :: String -> String
duplicateEncode s = map getToken lower
  where
    lower = map toLower s
    getToken c | ((>1) . length . filter (==c)) lower = ')'
               | otherwise = '('
