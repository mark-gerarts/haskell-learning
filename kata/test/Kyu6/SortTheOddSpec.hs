module Kyu6.SortTheOddSpec where

import Test.Hspec
import Kyu6.SortTheOdd

spec :: Spec
spec =
  describe "The sortArray function" $
    it "should work for some examples" $ do
      sortArray [5, 3, 2, 8, 1, 4] `shouldBe` [1, 3, 2, 8, 5, 4]
      sortArray [5, 3, 1, 8, 0] `shouldBe` [1, 3, 5, 8, 0]
      sortArray [] `shouldBe` []
