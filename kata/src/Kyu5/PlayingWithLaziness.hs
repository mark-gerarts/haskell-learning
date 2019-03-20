module Kyu5.PlayingWithLaziness where

type Matrix = [[Bool]]

findTrue :: Matrix -> (Int, Int)
findTrue m = head [(x, y) | (x, y) <- indexes, m !! x !! y]
  where
    indexes = [(x, y) | i <- [0..], x <- [0..i], y <- [0..i]]

generate :: Int -> Int -> Matrix
generate n m =
  let falses = repeat False
      oneTrue = replicate m False ++ [ True ] ++ falses
  in replicate n falses ++ [oneTrue] ++ repeat falses
