module Kyu5.Rot13Spec where

import Test.Hspec

import Kyu5.Rot13 (rot13)

spec :: Spec
spec =
  describe "rot13" $ do
    it "test" $
      rot13 "test" `shouldBe` "grfg"
    it "Test" $
      rot13 "Test" `shouldBe` "Grfg"
