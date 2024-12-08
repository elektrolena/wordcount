module RBTreeSpec (spec) where

import Test.Hspec
import RBTree (RBTree, buildTree, inOrderTraversal)

spec :: Spec
spec = describe "RBTree" $ do
    it "should return an empty list for an empty tree" $ do
        let tree = buildTree ([] :: [String])
        inOrderTraversal tree `shouldBe` []

    it "should return a sorted list for inserted elements" $ do
        let wordsList = ["banana", "apple", "cherry", "apple"]
            tree = buildTree wordsList
        inOrderTraversal tree `shouldBe` ["apple", "banana", "cherry"] 
        -- 'apple' erscheint nur einmal, wenn Ihr Baum Duplikate korrekt behandelt,
        -- sonst sollten Sie sicherstellen, dass Duplikate nicht eingefügt werden.

    it "should maintain order after multiple insertions" $ do
        let wordsList = ["z", "x", "m", "a", "b", "y"]
            tree = buildTree wordsList
        inOrderTraversal tree `shouldBe` ["a","b","m","x","y","z"]
