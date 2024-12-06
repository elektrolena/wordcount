-- Test for Reading Text in file

module FileReaderSpec (spec) where

import Test.Hspec
import FileReader (readFileContent)
import Writer (writeToFile)
import System.Directory (removeFile, doesFileExist)

spec :: Spec
spec = do
  describe "File Input/Output" $ do

    it "reads content from a file" $ do
      -- Setup: Schreibe eine temporäre Datei
      let testFile = "test-input.txt"
      writeFile testFile "Hello, Haskell!"

      -- Teste die Funktion
      content <- readFileContent testFile
      content `shouldBe` "Hello, Haskell!"

      -- Aufräumen
      removeFile testFile

    it "writes content to a file" $ do
      -- Setup: Definiere die Testdaten
      let testFile = "test-output.txt"
      let testContent = ["Hello", "Haskell", "Testing"]

      -- Teste die Funktion
      writeToFile testFile testContent

      -- Überprüfen, ob die Datei den korrekten Inhalt enthält
      content <- readFile testFile
      content `shouldBe` "Hello\nHaskell\nTesting\n"

      -- Aufräumen
      removeFile testFile
