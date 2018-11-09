module Kyu6.BouncingBallsSpec where

import Kyu6.BouncingBalls
import Test.Hspec

spec :: Spec
spec =
    describe "BouncingBall" $
        it "1st series" $ do
            bouncingBall 3.0 0.66 1.5 `shouldBe` 3
            bouncingBall 30.0 0.66 1.5 `shouldBe` 15
