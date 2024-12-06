module FileReader (readFileContent) where


-- Reads input file and returns text as string
readFileContent :: FilePath -> IO String
readFileContent path = do
  readFile path
