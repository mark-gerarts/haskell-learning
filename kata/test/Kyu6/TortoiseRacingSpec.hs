module Kyu6.TortoiseRacingSpec where

import Kyu6.TortoiseRacing
import Test.Hspec
import Text.Printf (printf)

testTortoise :: Int -> Int -> Int -> Maybe (Int, Int, Int) -> Spec
testTortoise v1 v2 g s =
  it (printf "should return race where v1: %d v2: %d lead: %d " v1 v2 g) $
    race v1 v2 g `shouldBe` s

testSeconds :: Int -> (Int, Int, Int) -> Spec
testSeconds s expected =
  it (printf "should parse seconds with %d seconds" s) $
    parseSeconds s `shouldBe` expected

spec :: Spec
spec =
    describe "Basic Tests" $ do
        testTortoise 720 850 70 (Just (0, 32, 18))
        testTortoise 80 100 40 (Just (2, 0, 0))
        testTortoise 80 91 37 (Just (3, 21, 49))
        testTortoise 720 850 37 (Just (0, 17, 4))
        testSeconds 3600 (1, 0, 0)
        testSeconds 3601 (1, 0, 1)
        testSeconds 72 (0, 1, 12)
        testSeconds 3599 (0, 59, 59)
