import Data.Char
import Data.List
main :: IO()
main = do
    _ : list <- lines <$> getContents
    -- ["12","1012"]
    let x1 = map (read::String->Int) list
    -- [12,1012]
    let x2 = map sep list
    -- [[1,2],[1,0,1,2]]
    let x3 = zip x1 x2
    -- [(12,[1,2]),(1012,[1,0,1,2])]
    let x4 = map f x3
    mapM_ print x4

-- |
-- >> sep "1234" 
-- [1,2,3,4]
sep :: String -> [Int]
sep = map digitToInt


f :: Integral a => (a, [a]) -> Int
f (n,xs) = length $ filter (\x -> n `mod` x == 0) $ filter (/= 0) xs


-- type input\FindDigits.txt | stack runghc FindDigits.hs
-- https://www.hackerrank.com/challenges/find-digits