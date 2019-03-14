module TotalPoints where

points :: [String] -> Int
points = sum . map (result . parse)
  where
    result (a, b) | a > b = 3
                  | a < b = 0
                  | otherwise = 1

parse :: String -> (Int, Int)
parse points = (read $ take 1 points, read $ drop 2 points)
