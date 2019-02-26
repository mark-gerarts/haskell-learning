module UI where

import System.Random

import Hangman

data Game = Game { targetWord :: String
                 , guesses :: [Char]
                 , lives :: Int
                 }

loadWords :: IO [String]
loadWords = do
  wordList <- readFile "data/words.txt"
  return (lines wordList)
