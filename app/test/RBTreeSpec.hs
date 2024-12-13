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

    it "should maintain order after multiple insertions" $ do
        let wordsList = ["z", "x", "m", "a", "b", "y"]
            tree = buildTree wordsList
        inOrderTraversal tree `shouldBe` ["a","b","m","x","y","z"]

    it "should handle a single element" $ do
        let tree = buildTree ["single"]
        inOrderTraversal tree `shouldBe` ["single"]

    it "should handle duplicate elements and store only one" $ do
        let wordsList = ["duplicate", "duplicate", "duplicate"]
            tree = buildTree wordsList
        inOrderTraversal tree `shouldBe` ["duplicate"]

    it "should handle an already sorted list" $ do
        let sortedList = ["apple", "banana", "cherry"]
            tree = buildTree sortedList
        inOrderTraversal tree `shouldBe` sortedList

    it "should handle a reverse sorted list" $ do
        let reverseList = ["z", "y", "x", "w", "v"]
            tree = buildTree reverseList
        inOrderTraversal tree `shouldBe` ["v", "w", "x", "y", "z"]

    it "should handle integers and return them sorted" $ do
        let intList = [10, 1, 3, 7, 5]
            tree = buildTree intList
        inOrderTraversal tree `shouldBe` [1, 3, 5, 7, 10]

    it "should handle an empty string" $ do
        let tree = buildTree [""]
        inOrderTraversal tree `shouldBe` [""]

    it "should handle mixed case strings and maintain lexicographical order" $ do
        let wordsList = ["Apple", "apple", "Banana", "banana"]
            tree = buildTree wordsList
        inOrderTraversal tree `shouldBe` ["Apple", "Banana", "apple", "banana"]

    it "should handle large input efficiently" $ do
        let largeInput = [1..1000]
            tree = buildTree largeInput
        inOrderTraversal tree `shouldBe` [1..1000]

