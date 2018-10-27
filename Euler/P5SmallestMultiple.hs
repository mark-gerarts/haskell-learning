module P5SmallestMultiple where

isEvenlyDivisbleBy :: [Int] -> Int -> Bool
isEvenlyDivisbleBy ds n = all (\x -> n `mod` x == 0) ds

-- Inefficient..
smallestMultiple :: [Int] -> Int
smallestMultiple ds = smallestMultipleRec ds 2
  where
    smallestMultipleRec :: [Int] -> Int -> Int
    smallestMultipleRec ds' n
      | isEvenlyDivisbleBy ds' n = n
      | otherwise = smallestMultipleRec ds' (n + 2)
