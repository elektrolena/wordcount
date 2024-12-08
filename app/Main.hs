{-# LANGUAGE BangPatterns #-}
module Main where

import System.Directory (getCurrentDirectory)
import System.FilePath ((</>))
import RBTree (buildTree, inOrderTraversal)
import Tokenizer (tokenizeText)
import FileReader (readFileContent)
import Writer (writeToFile)
import Util (toUniqueSortedWords)

main :: IO ()
main = do
  currentDir <- getCurrentDirectory
  let inputFile = currentDir </> "app/input/war-and-peace.txt"
  let outputFile = currentDir </> "app/output/output.txt"

  -- Read file
  text <- readFileContent inputFile

  -- Tokenize the text unto words
  let wordsList = tokenizeText text

  -- Remove duplicates and sort words --> TODO: is it correct to sort before creating the tree?
  let uniqueSorted = toUniqueSortedWords wordsList

  -- Create the tree with the sorted words
  let tree = buildTree uniqueSorted

  -- Traverses the tree in order
  let sortedWords = inOrderTraversal tree

  -- Writes the sortedWords into the output file
  writeToFile outputFile sortedWords

  -- TODO: when presenting, should we only tun the tests or the program as well? How do we measure the runtime?
