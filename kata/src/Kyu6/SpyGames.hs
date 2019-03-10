module Kyu6.SpyGames where

import Data.Char

decrypt :: String -> String
decrypt = concatMap decryptWord . words

decryptWord :: String -> String
decryptWord = (:[]) . toLetter . sum . map digitToInt . filter isDigit

toLetter :: Int -> Char
toLetter x = if x' == 0 then ' '
             else chr (x' + 96)
  where x' = x `mod` 27
