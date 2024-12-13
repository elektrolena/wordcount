module Writer (writeToFile) where

import System.Directory (createDirectoryIfMissing)
import System.FilePath (takeDirectory)

writeToFile :: FilePath -> [String] -> IO ()
writeToFile path sortedWords = do
    createDirectoryIfMissing True (takeDirectory path)
    writeFile path (unlines sortedWords)
