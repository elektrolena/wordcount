module FileReaderSpec (spec) where

import Test.Hspec
import FileReader (readFileContent)
import System.Directory (getCurrentDirectory)
import System.FilePath ((</>))
import Control.Exception (try, IOException)

spec :: Spec
spec = describe "FileReader" $ do
    it "should read the content of a file correctly" $ do
        currentDir <- getCurrentDirectory
        let testFile = currentDir </> "app/test/testfile.txt"
        content <- readFileContent testFile
        content `shouldBe` "This is a test file."

    it "should throw an error if the file does not exist" $ do
        currentDir <- getCurrentDirectory
        let testFile = currentDir </> "app/test/non_existent_file.txt"
        result <- try (readFileContent testFile) :: IO (Either IOException String)
        case result of
            Left _ -> pure ()
            Right _ -> expectationFailure "Expected an IOException but none was thrown"
    

