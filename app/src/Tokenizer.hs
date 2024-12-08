module Tokenizer (tokenizeText) where

import Data.Char (toLower, isAlpha)
import Control.Parallel.Strategies (parMap, rdeepseq)

-- Cleans a word: only alphabetical signs in lowercase
cleanWord :: String -> String
cleanWord = map toLower . filter isAlpha

-- Divides text into its lines to tokenize every line parallel -> Parallelization
tokenizeText :: String -> [String]
tokenizeText text =
  let ls = lines text
      -- Hier alle Zeilen tokenisieren und bereinigen:
      tokenizedLines = parMap rdeepseq (map cleanWord . words) ls
  in concatMap (filter (not . null)) tokenizedLines
