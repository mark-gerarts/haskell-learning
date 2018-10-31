module Kyu6.BuildTowerSpec where

import Kyu6.BuildTower
import Test.Hspec

spec :: Spec
spec = describe "buildTower" $ do
    it "tower with 1 floor"  $ buildTower 1 `shouldBe` [ "*"
                                                       ]
    it "tower with 2 floors" $ buildTower 2 `shouldBe` [ " * "
                                                       , "***"
                                                       ]
    it "tower with 3 floors" $ buildTower 3 `shouldBe` [ "  *  "
                                                       , " *** "
                                                       , "*****"
                                                       ]
