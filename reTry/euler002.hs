-- import Data.Function.Memoize

main :: IO()
main = do
   _:list <- lines <$> getContents
   mapM_ (print . f . string2Int) list

f :: Integer -> Integer
f n = sum $ filter even $ takeWhile (< n) fib

-- fibMemo = memoize fib

fib :: [Integer]   
fib = 1:2:zipWith (+) fib (tail fib)

string2Int :: String -> Integer
string2Int = read

--https://www.hackerrank.com/contests/projecteuler/challenges/euler002
-- type input\euler002.txt | stack runghc euler002.hs