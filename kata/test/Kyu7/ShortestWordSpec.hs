module Kyu7.ShortestWordSpec where

import Test.Hspec
import Kyu7.ShortestWord

spec :: Spec
spec =
  describe "Prelude.head" $
    it "Example Tests" $
      map find_shortest [l1, l2, l3, l4, l5] `shouldBe` ([3,3,3,1,2] :: [Integer])

l1 = "bitcoin take over the world maybe who knows perhaps"
l2 = "turns out random test cases are easier than writing out basic ones"
l3 = "lets talk about javascript the best language"
l4 = "i want to travel the world writing code one day"
l5 = "Lets all go on holiday somewhere very cold"
