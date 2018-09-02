module Kyu7.VowelCountSpec where

import Test.Hspec
import Kyu7.VowelCount
import Test.QuickCheck

spec :: Spec
spec =
  describe "getCount" $ do
    it "should work for some examples" $ do
      getCount "ape"         `shouldBe` 2
      getCount "banana"      `shouldBe` 3
      getCount "batman"      `shouldBe` 2
      getCount "abracadabra" `shouldBe` 5

    it "should work for vowel-only strings" $
      property $ \n -> n >= 0 ==>
        getCount (take n . cycle $ "aeiou") `shouldBe` n
    it "should work for consonant strings" $
      property $ \n -> n >= 0 ==>
        getCount (take n . cycle $ "bcdfghjklmnpqrstvwxyz") `shouldBe` 0
