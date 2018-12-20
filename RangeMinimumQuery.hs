--import qualified Data.ByteString.Char8 as B
main :: IO()
main = do
  (_:line:xs) <- lines <$> getContents
  let list = map read' . words $ line
-- [10,20,30,40,11,22,33,44,15,5]
  let qs = map (map read' . words) xs
-- [[0,5],[1,2],[8,9],[0,9],[4,6]]
  mapM_ (print . (`solve` list)) qs

read' :: String -> Int
read' = read

solve :: [Int] -> [Int] -> Int
solve [a, b] = minimum' . take (b - a + 1) . drop a
solve _ = 0

minimum' :: (Ord t1, Num t1, Foldable t) => t t1 -> t1
minimum' xs
  | null xs = 0
  | otherwise = minimum xs

{-- 第一引数の数だけ
solve' :: (Eq a, Num a , Ord b, Bounded b) => a -> [b] -> [b]
solve' 0 _ = maxBound
solve' _ [] = maxBound
solve' n (x:xs) = min x $ solve' (n-1) xs
--}

-- https://www.hackerrank.com/challenges/range-minimum-query/problem
-- type input\FindthePoint.txt | stack runghc RangeMinimumQuery.hs