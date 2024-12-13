module WriterSpec (spec) where

import Test.Hspec
import Writer (writeToFile)
import System.IO (readFile, writeFile)
import System.Directory (removeFile, getCurrentDirectory, setPermissions, Permissions(..), doesFileExist)
import System.FilePath ((</>))
import Control.Exception (try, IOException)

spec :: Spec
spec = describe "Writer" $ do
    it "should write a list of words to a file, one per line" $ do
        currentDir <- getCurrentDirectory
        let testOut = currentDir </> "app/test/output_test.txt"
        let wordsList = ["hello", "world", "test"]
        writeToFile testOut wordsList
        content <- readFile testOut
        content `shouldBe` "hello\nworld\ntest\n"
        removeFile testOut

    it "should create the file if it does not exist" $ do
        currentDir <- getCurrentDirectory
        let testOut = currentDir </> "app/test/non_existent_file.txt"
        let wordsList = ["new", "file", "test"]
        fileExistsBefore <- doesFileExist testOut
        fileExistsBefore `shouldBe` False
        writeToFile testOut wordsList
        fileExistsAfter <- doesFileExist testOut
        fileExistsAfter `shouldBe` True
        content <- readFile testOut
        content `shouldBe` "new\nfile\ntest\n"
        removeFile testOut
