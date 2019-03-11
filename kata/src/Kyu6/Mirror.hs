module Mirror where

import Data.List
import Data.Ord

mirror :: String -> String
mirror s = border ++ "\n" ++ concatMap formatLine ws ++ border
  where
    ws = words s
    rowLength = length (maximumBy (comparing length) ws) + 4
    formatLine l = "* " ++ reverse l ++ replicate (rowLength - length l - 4) ' ' ++ " *\n"
    border = replicate rowLength '*'

test = mirror "emosewA !ataK"
