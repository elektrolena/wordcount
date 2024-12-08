module Util (toUniqueSortedWords) where

import qualified Data.Set as S

-- Convert a list of words into a sorted list of words using Set to eliminate duplicates
toUniqueSortedWords :: [String] -> [String]
toUniqueSortedWords ws = S.toAscList (S.fromList (filter (not . null) ws))
