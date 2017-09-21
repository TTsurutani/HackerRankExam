main :: IO()
main = do
    _:list <- lines <$> getContents
    -- ["2 1","5 1","5 2","5 3","10 5"] :[[Char]]
    let temp = map words list
    -- [["2","1"],["5","1"],["5","2"],["5","3"],["10","5"]]
    let ans = map (\(n:k:_) -> count (read n) (read k)) temp
    mapM_ print ans

fact :: Integer -> Integer
fact n = product [1..n]

comb :: Integer -> Integer -> Integer
comb n k = fact n `div` (fact k * fact (n - k))

count :: Integer -> Integer -> Integer
count n k 
   | k == 0 = 1
   | k == n  = 1
   | otherwise = comb n k `mod` 100000007  

-- https://www.hackerrank.com/challenges/different-ways-fp
-- type input\DifferentWays.txt | stack runghc DifferentWays.hs
