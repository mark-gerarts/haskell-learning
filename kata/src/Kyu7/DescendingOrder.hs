module Kyu7.DescendingOrder where

import Data.List
import Data.Ord

descendingOrder :: Integer -> Integer
descendingOrder = read . sortOn Down . show
