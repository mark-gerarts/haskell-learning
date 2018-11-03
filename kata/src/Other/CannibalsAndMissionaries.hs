module Other.CannibalsAndMissionaries where

-- Thirty cannibals begin to eat ten missionaries. It takes an hour to consume
-- the first missionary. After each HOUR, one cannibal steals away into the
-- forest. Each cannibal eats at a constant rate. Therefore, since there are
-- fewer consumers (cannibals), fewer missionaries will be consumed in each
-- hour. Fortunately for the missionaries, help is on the way. Tarzan is
-- coming! However, he is 80 miles away. During the day Tarzan travels at seven
-- miles per hour. During the darkness he reduces his speed to 4 miles per
-- hour. Darkness lasts nine hours. When the cannibals start eating, there are
-- only three hours of light left.
--
-- Write a program to calculate and display how many cannibals will be caught
-- and how many missionaries saved (if any).
import Text.Printf

data State = State
  { cannibals :: Int
  , missionaries :: Double
  , tarzanDistance :: Int
  , hours :: Int
  }

instance Show State where
  show State {cannibals=c, missionaries=m, tarzanDistance=td, hours=h} =
    printf "%5s %10s %12s %15s" (show h) (show c) (printDouble m) (show td)
    where
      printDouble :: Double -> String
      printDouble = printf "%.2f"

eatingRate :: Double
eatingRate = 1 / 30

initialState :: State
initialState =
  State {cannibals = 30, missionaries = 10, tarzanDistance = 80, hours = 0}

progress :: State -> State
progress State {cannibals=c, missionaries=m, tarzanDistance=td, hours=h} =
  let isDark = (24 + h - 3) `mod` 24 < 9
      tarzanSpeed = if isDark then 4 else 7
      newMissionaries = zeroIfNegative (m - (fromIntegral c * eatingRate))
      newDistance = zeroIfNegative (td - tarzanSpeed)
  in State (c - 1) newMissionaries newDistance (h + 1)

zeroIfNegative :: (Num a, Ord a) => a -> a
zeroIfNegative x | x < 0 = 0
                 | otherwise = x

tableHeader :: String
tableHeader =
  printf "%5s %10s %12s %15s" "Hours" "Cannibals" "Missionaries" "Tarzan distance"
  ++ "\n" ++ border 5 ++ border 10 ++ border 12 ++ border 15
  where
    border l = replicate l '-' ++ " "

printAndStep :: State -> IO ()
printAndStep state = do
  print state
  if tarzanDistance state <= 0
    then return ()
    else printAndStep $ progress state

main :: IO ()
main = do
  putStrLn tableHeader
  printAndStep initialState
