module FileReaderSpec (spec) where

import Test.Hspec
import FileReader (readFileContent)
import System.Directory (getCurrentDirectory)
import System.FilePath ((</>))

spec :: Spec
spec = describe "FileReader" $ do
    it "should read the content of a file correctly" $ do
        currentDir <- getCurrentDirectory
        let testFile = currentDir </> "app/test/testfile.txt"
        content <- readFileContent testFile
        content `shouldBe` "This is a test file."
