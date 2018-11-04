module Kyu6.LongestPalindrome where

import Control.Monad
import Data.List

longestPalindrome :: Eq a => [a] -> Int
longestPalindrome [] = 0
longestPalindrome xs = (maximum . map length . filter isPalindrome . substrings) xs

isPalindrome :: Eq a => [a] -> Bool
isPalindrome xs = xs == reverse xs

substrings :: [a] -> [[a]]
substrings = tail . inits <=< tails
