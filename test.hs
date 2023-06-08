import Data.List (sortOn)

depth :: Char -> String -> Int
depth _ [] = 0
depth y (x : xs)
  | x == y = depth y xs + 1
  | otherwise = depth y xs

head' :: [String] -> String
head' [] = "Not Found"
head' xs = head xs

section :: [String] -> String
section = head' . sortOn (depth '.')