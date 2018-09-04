module Kyu6.MiniBitMoveSpec where

import Test.Hspec
import Kyu6.MiniBitMove

spec :: Spec
spec =
  describe "Example Tests" $ do
    it "Flips all bits in an array"
      (interpreter "10" "1100101" `shouldBe` "0011010")
    it "Flips every second bit in an array"
      (interpreter "100" "1111111111" `shouldBe` "0101010101")
