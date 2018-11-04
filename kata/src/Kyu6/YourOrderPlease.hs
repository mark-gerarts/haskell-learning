module Kyu6.YourOrderPlease where

import Data.Char
import Data.List

yourOrderPlease :: String -> String
yourOrderPlease = unwords . sortOn (filter isNumber) . words
