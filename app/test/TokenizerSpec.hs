module TokenizerSpec (spec) where

import Test.Hspec
import Tokenizer (tokenizeText)

spec :: Spec
spec = describe "Tokenizer" $ do
    it "should split text into lowercase words without punctuation" $ do
        let text = "Hello, world! This is a test."
        let tokens = tokenizeText text
        tokens `shouldBe` ["hello","world","this","is","a","test"]

    it "should handle empty strings gracefully" $ do
        let text = ""
        tokenizeText text `shouldBe` []

    it "should remove numbers and punctuation" $ do
        let text = "Numbers 123 and punctuation!!! Are gone."
        tokenizeText text `shouldBe` ["numbers","and","punctuation","are","gone"]
