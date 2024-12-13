{-# LANGUAGE BangPatterns #-}
module Main where

import System.Directory (getCurrentDirectory)
import System.FilePath ((</>))
import RBTree (buildTree, inOrderTraversal)
import Tokenizer (tokenizeText)
import FileReader (readFileContent)
import Writer (writeToFile)

main :: IO ()
main = do
  currentDir <- getCurrentDirectory
  let inputFile = currentDir </> "app/input/war-and-peace.txt"
  let outputFile = currentDir </> "app/output/output.txt"

  writeToFile outputFile . inOrderTraversal . buildTree . tokenizeText =<< readFileContent inputFile
