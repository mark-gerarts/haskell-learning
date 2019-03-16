module DistinctDigitYear where

import Data.List

distinctDigitYear :: Int -> Int
distinctDigitYear year = go (year + 1)
  where
    go y = if isDistinct y then y else go (y + 1)
    isDistinct x = (length . nub . show) x == (length . show) x
