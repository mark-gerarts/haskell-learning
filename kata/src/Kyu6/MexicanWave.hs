module MexicanWave where

import Data.Char

wave :: String -> [String]
wave xs = filter (any isUpper) $ map (ucAt xs) [0..length xs - 1]
  where
    ucAt s i = take i s ++ [toUpper (s !! i)] ++ drop (i + 1) s
