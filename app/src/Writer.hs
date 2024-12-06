module Writer (writeToFile) where


-- writes a list of words into output file
writeToFile :: FilePath -> [String] -> IO ()
writeToFile path words = do
  writeFile path (unlines words)
