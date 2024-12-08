module UtilSpec (spec) where

import Test.Hspec
import Util (toUniqueSortedWords)

spec :: Spec
spec = describe "Util" $ do
    it "should remove duplicates and sort words" $ do
        let inputWords = ["banana","apple","apple","cherry","banana"]
        toUniqueSortedWords inputWords `shouldBe` ["apple","banana","cherry"]

    it "should handle empty lists" $ do
        toUniqueSortedWords [] `shouldBe` []
