module Kyu6.MiniBitMove where

-- https://www.codewars.com/kata/587c0138110b20624e000253/train/haskell
interpreter :: String -> String -> String
interpreter program input = handleInstructions program input 0 0

handleInstructions :: String -> String -> Int -> Int -> String
handleInstructions program input programPointer inputPointer
  | inputPointer == length input = input
  | program !! programPointer == '1' =
    handleInstructions program newInput newPointer inputPointer
  | otherwise = handleInstructions program input newPointer (inputPointer + 1)
  where
    newPointer = nextProgramPointer program programPointer
    newInput = flipBitAt input inputPointer

flipBitAt :: String -> Int -> String
flipBitAt input i = take i input ++ [flipBit $ input !! i] ++ drop (i + 1) input

flipBit :: Char -> Char
flipBit '1' = '0'
flipBit '0' = '1'
flipBit _ = error "Trying to flip something else than a bit"

nextProgramPointer :: String -> Int -> Int
nextProgramPointer program i =
  if inc >= length program
    then 0
    else inc
  where
    inc = i + 1
