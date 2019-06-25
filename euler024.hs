import Data.List
ans = (sort $ map (read::String->Int) $ permutations "0123456789") !! 999999