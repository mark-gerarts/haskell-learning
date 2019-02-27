module Hangman where

import System.Random
import Data.Char

data Game = Game { _targetWord :: String
                 , _guesses :: [Char]
                 , _lives :: Int
                 } deriving (Show)

loadWords :: IO [String]
loadWords = do
  wordFile <- readFile "data/words.txt"
  return (lines wordFile)

randomWord :: IO String
randomWord = do
  words <- loadWords
  r <- randomRIO (0, (length words) - 1)
  return (words !! r)

guessLetter :: Char -> Game -> Game
guessLetter c (Game targetWord guesses lives) =
  Game targetWord (c : guesses) newLives
  where
    newLives = if containsLetter c targetWord then lives else lives - 1


containsLetter :: Char -> String -> Bool
containsLetter c = (c `elem`) . map toLower
