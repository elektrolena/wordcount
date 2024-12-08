module Writer (writeToFile) where

-- Writes a list of words in a file
writeToFile :: FilePath -> [String] -> IO ()
writeToFile path sortedWords = writeFile path (unlines sortedWords)
