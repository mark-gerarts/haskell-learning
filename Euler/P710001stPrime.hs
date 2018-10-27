module P710001stPrime where

isPrime :: Int -> Bool
isPrime n = null [x | x <- [2..(floor . sqrt . fromIntegral) n], n `mod` x == 0]

primes :: [Int]
primes = filter isPrime (2 : [3,5..])

nthPrime :: Int -> Int
nthPrime n = primes !! (n - 1)
