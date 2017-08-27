main :: IO()
main = do
    _:list <- lines <$> getContents
    mapM_ print $ map solve list

solve :: String -> Int
solve xs = (length xs) - (length $ del xs)

del :: String -> String
del [x] = [x]
del (x:y:xs)
    | x == y    = del (y:xs)
    | otherwise = x : del (y:xs) 

-- type input\AlternatingCharacters.txt | stack runghc AlternatingCharacters.hs
-- https://www.hackerrank.com/challenges/alternating-characters