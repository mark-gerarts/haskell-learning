module Kyu8.ReversedStringsSpec where

import Test.Hspec
import Kyu8.ReversedStrings

spec :: Spec
spec =
  describe "solution" $
    it "reverses a string" $
      solution "World!" `shouldBe` "!dlroW"
