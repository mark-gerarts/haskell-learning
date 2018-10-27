module P4LargestPalindromeProduct where

import Data.List
import Data.Ord

int2digits :: Int -> [Int]
int2digits 0 = []
int2digits x = int2digits (x `div` 10) ++ [x `mod` 10]

isPalindrome :: Int -> Bool
isPalindrome n = digits == reverse digits
  where
    digits = int2digits n

largestPalindromProduct :: Int
largestPalindromProduct = head $ sortOn Down $ filter isPalindrome products
  where
    products = [x * y | x <- threeDigitNumbers, y <- threeDigitNumbers]
    threeDigitNumbers = [999, 998..1]
