main :: IO()
main = do
    _:list <- lines <$> getContents
    print $ map words list

count :: Int -> Int -> Int
count n k 
   | k == 0 = 1
   | k == n  = 1
   | otherwise = count (n -1) (k - 1) + count (n -1) k

-- https://www.hackerrank.com/challenges/different-ways-fp
-- type input\DifferentWays.txt | stack runghc DifferentWays.hs
