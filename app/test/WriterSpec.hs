module WriterSpec (spec) where

import Test.Hspec
import Writer (writeToFile)
import System.IO (readFile)
import System.Directory (removeFile, getCurrentDirectory)
import System.FilePath ((</>))

spec :: Spec
spec = describe "Writer" $ do
    it "should write a list of words to a file, one per line" $ do
        currentDir <- getCurrentDirectory
        let testOut = currentDir </> "app/test/output_test.txt"
        let wordsList = ["hello","world","test"]
        writeToFile testOut wordsList
        content <- readFile testOut
        content `shouldBe` "hello\nworld\ntest\n"
        removeFile testOut
