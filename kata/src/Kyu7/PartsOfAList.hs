module PartsOfAList where

partlist :: [String] -> [(String, String)]
partlist xs = map (\i -> (unwords (take i xs), unwords (drop i xs))) [1..length xs - 1]
