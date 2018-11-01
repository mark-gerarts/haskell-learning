module Kyu6.PianoKataP1  where

data Key = B | W

instance Show Key where
  show B = "black"
  show W = "white"

piano :: [Key]
piano = [W,B,W] ++ (concat . replicate 7) scale ++ [W]
  where
    scale = [W,B,W,B,W,W,B,W,B,W,B,W]

blackOrWhiteKey :: Int -> String
blackOrWhiteKey n = show $ (concat . repeat) piano !! (n - 1)
