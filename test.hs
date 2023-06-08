import Data.List (sortOn)
type Section = String
type Separator = Char

depth :: Separator -> Section -> Int
depth _ [] = 0
depth sep (x : xs)
  | x == sep = depth sep xs + 1
  | otherwise = depth sep xs

head' :: [Section] -> Section
head' [] = "Not Found"
head' xs = head xs

section :: [Section] -> Section
section = head' . sortOn (depth '.')