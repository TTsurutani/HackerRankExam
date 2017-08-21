
main :: IO()
main = do
    _ : list <- lines <$> getContents
    print $ map words list


-- type input\ListsAndGCD.txt | stack runghc ListsAndGCD.hs
-- https://www.hackerrank.com/challenges/lists-and-gcd