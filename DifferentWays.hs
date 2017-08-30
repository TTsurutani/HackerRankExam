import Data.Function.Memoize

main :: IO()
main = do
    _:list <- lines <$> getContents
    -- ["2 1","5 1","5 2","5 3","10 5"] :[[Char]]
    let temp = map words list
    -- [["2","1"],["5","1"],["5","2"],["5","3"],["10","5"]]
    let ans = map (\(n:k:_) -> count (read n) (read k)) temp
    mapM_ print ans

 
countMemo :: Int -> Int -> Int
countMemo = memoize2 count    


count :: Int -> Int -> Int
count n k 
   | k == 0 = 1
   | k == n  = 1
   | otherwise = countMemo (n -1) (k - 1) + countMemo (n -1) k

-- https://www.hackerrank.com/challenges/different-ways-fp
-- type input\DifferentWays.txt | stack runghc DifferentWays.hs
