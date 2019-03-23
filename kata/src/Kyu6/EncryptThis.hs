module Kyu6.EncryptThis where

import Data.Char

encryptThis :: String -> String
encryptThis = unwords . map encryptWord . words

encryptWord :: String -> String
encryptWord [] = []
encryptWord [c] = show $ ord c
encryptWord (a:b:cs)
  | null cs = encryptThis [a] ++ [b]
  | otherwise = encryptThis [a] ++ [last cs] ++ init cs ++ [b]
