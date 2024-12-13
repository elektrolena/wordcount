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

    it "should handle text with only punctuation and spaces" $ do
        let text = "!!! ... ,,,"
        tokenizeText text `shouldBe` []

    it "should handle text with mixed case words" $ do
        let text = "Hello WoRLd"
        tokenizeText text `shouldBe` ["hello", "world"]

    it "should handle text with multiple spaces between words" $ do
        let text = "hello      world"
        tokenizeText text `shouldBe` ["hello", "world"]

    it "should handle text with newline characters" $ do
        let text = "hello\nworld\nthis is\na test"
        tokenizeText text `shouldBe` ["hello", "world", "this", "is", "a", "test"]

    it "should handle text with empty lines" $ do
        let text = "hello\n\nworld\n\n"
        tokenizeText text `shouldBe` ["hello", "world"]

    it "should ignore words containing only non-alphabetic characters" $ do
        let text = "1234 $$$ ***"
        tokenizeText text `shouldBe` []

    it "should handle text with special characters within words" $ do
        let text = "email@example.com hello-world"
        tokenizeText text `shouldBe` ["emailexamplecom", "helloworld"]

    it "should handle Unicode characters correctly" $ do
        let text = "Héllo Wörld 你好 世界"
        tokenizeText text `shouldBe` ["héllo", "wörld", "你好", "世界"]
