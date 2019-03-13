module FizzBuzzCuckooClock where

type Time = (Int, Int)

fizzBuzzCuckooClock :: String -> String
fizzBuzzCuckooClock = fizzBuzzCuckoo . parseTime

fizzBuzzCuckoo :: Time -> String
fizzBuzzCuckoo (hours, minutes)
  | minutes == 0 = unwords $ replicate hours "Cuckoo"
  | minutes == 30 = "Cuckoo"
  | isMod 15 minutes = "Fizz Buzz"
  | isMod 5 minutes = "Buzz"
  | isMod 3 minutes = "Fizz"
  | otherwise = "tick"

isMod :: Int -> Int -> Bool
isMod a b = b `mod` a == 0

parseTime :: String -> Time
parseTime t = (hours12, minutes)
  where
    hours24 = (read $ take 2 t) :: Int
    hours12 | hours24 > 12 = hours24 - 12
            | hours24 == 0 = 12
            | otherwise = hours24
    minutes = read $ drop 3 t
