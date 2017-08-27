import Data.Function.Memoize

main :: IO()
main = do
    _:list <- lines <$> getContents
    print $ map words list

countMemo :: Int -> Int -> Int
countMemo = memoize2 count    


count :: Int -> Int -> Int
count n k 
   | k == 0 = 1
   | k == n  = 1
   | otherwise = countMemo (n -1) (k - 1) + countMemo (n -1) k

-- https://www.hackerrank.com/challenges/different-ways-fp
-- type input\DifferentWays.txt | stack runghc DifferentWays.hs
