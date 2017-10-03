main :: IO()
main = do
    _:xs <- lines <$> getContents
    let list = map string2Int xs
    -- [10,17]
    let sieveList = map g list
    -- [[7,5,3,2],[17,13,11,7,5,3,2]]
    let ans = zipWith f list sieveList
    mapM_ print ans

--　素数リストで割り切れたところで終わり
f :: Integer -> [Integer] -> Integer
f x (y:ys)
  | x `mod` y == 0 = y
  | otherwise = f x ys

-- 入力値以内の素数の逆順リスト    
g :: Integer -> [Integer]
g n = reverse $ takeWhile (<= n ) primes
-- リストの先頭で以降を篩う    
sieve :: [Integer] -> [Integer]
sieve (x:xs) = x : [y | y <- xs, y `mod` x /= 0]

primes :: [Integer]
primes = 2:sieve[3,5..]

string2Int :: String -> Integer
string2Int = read    

-- https://www.hackerrank.com/contests/projecteuler/challenges/euler003
-- type input\euler003.txt | stack runghc euler003.hs