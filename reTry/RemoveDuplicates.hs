-- |
-- >>> remove a aabc
-- abc
-- >>> remove c ccbabacc
-- baba

-- main = interact remDup

module Foo where
remove :: Char -> String -> String
remove _ [] = []
remove y (x:xs) 
           | y == x = remove y xs
           | otherwise = x : remove y xs


remDup :: String -> String
remDup [] = []
remDup (x:xs)
         | x `elem` xs = x : remDup  (remove x xs)
         | otherwise = x : remDup xs