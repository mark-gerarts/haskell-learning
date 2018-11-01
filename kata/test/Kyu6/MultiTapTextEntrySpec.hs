module Kyu6.MultiTapTextEntrySpec where

import Kyu6.MultiTapTextEntry (presses)
import Test.Hspec

spec :: Spec
spec =
  describe "presses" $ do
    it "should work for simple examples" $
      presses "LOL" `shouldBe` 9
    it "should work for phrases with spaces" $
      presses "HOW R U" `shouldBe` 13
