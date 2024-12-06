module Main where

import System.Directory (getCurrentDirectory, setCurrentDirectory)
import System.FilePath ((</>))
import FileReader (readFileContent)
import Writer (writeToFile)

main :: IO ()
main = do
  currentDir <- getCurrentDirectory
  let inputFile = currentDir </> "app/input/war-and-peace.txt"
  let outputFile = currentDir </> "app/output/output.txt"

  -- Read input file
  content <- readFileContent inputFile

  -- Tokanize and insert words in tree
  let sortedWords = ["and", "peace", "tolstoy", "war", "novel", "is", "a", "by"]

  -- Write Result in output file
  writeToFile outputFile sortedWords
