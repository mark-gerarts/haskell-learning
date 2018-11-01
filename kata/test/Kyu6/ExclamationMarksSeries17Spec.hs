module Kyu6.ExclamationMarksSeries17Spec where

import Prelude hiding (Either(..))
import Kyu6.ExclamationMarksSeries17
import Test.Hspec

spec :: Spec
spec =
  describe "Example Tests" $
    it "should work with example tests" $ do
      balance ""           ""             `shouldBe` Balance
      balance "!!"         "??"           `shouldBe` Right
      balance "!??"        "?!!"          `shouldBe` Left
      balance "!?!!"       "?!?"          `shouldBe` Left
      balance "!!???!????" "??!!?!!!!!!!" `shouldBe` Balance
