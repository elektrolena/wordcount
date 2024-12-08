module FileReader (readFileContent) where

-- Reads the content of the file as a string
readFileContent :: FilePath -> IO String
readFileContent path = readFile path
