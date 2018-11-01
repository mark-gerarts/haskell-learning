module Kyu6.PianoKataP1Spec where

import Kyu6.PianoKataP1
import Test.Hspec

spec :: Spec
spec =
   describe "Sample test" $ do
     it "First Test" $
      (blackOrWhiteKey 1) `shouldBe` "white"
     it "Second Test" $
      (blackOrWhiteKey 5 ) `shouldBe` "black"
     it "Third Test" $
      (blackOrWhiteKey 12 ) `shouldBe` "black"
     it "Fourth Test" $
      (blackOrWhiteKey 42) `shouldBe` "white"
     it "Fifth Test" $
      (blackOrWhiteKey 88 ) `shouldBe` "white"
     it "Sixth Test" $
      (blackOrWhiteKey 89 ) `shouldBe` "white"
     it "Seventh Test" $
      (blackOrWhiteKey 92) `shouldBe` "white"
     it "Eigth Test" $
      (blackOrWhiteKey 100 ) `shouldBe` "black"
     it "Ninth Test" $
      (blackOrWhiteKey 111 ) `shouldBe` "white"
     it "Tenth Test" $
      (blackOrWhiteKey 200) `shouldBe` "black"
     it "Eleventh Test" $
      (blackOrWhiteKey 2017 ) `shouldBe` "white"
