module Kyu6.BuildTower where

buildTower :: Int -> [String]
buildTower h = map floor2string floors
  where
    floors = take h [1,3..]
    width = last floors
    floor2string f = let ws = replicate ((width - f) `div` 2) ' '
                     in ws ++ replicate f '*' ++ ws

printTower :: Int -> IO ()
printTower = putStr . unlines . buildTower
