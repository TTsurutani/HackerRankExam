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
f :: Int -> [Int] -> Int
f x (y:ys)
  | x `mod` y == 0 = y
  | otherwise = f x ys

-- 入力値以内の素数の逆順リスト    
g :: Int -> [Int]
g n = reverse $ takeWhile (<= n ) primes
-- リストの先頭で以降を篩う    
sieve :: [Int] -> [Int]
sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

primes :: [Int]
primes = sieve [2..]

string2Int :: String -> Int
string2Int = read    

-- https://www.hackerrank.com/contests/projecteuler/challenges/euler003
-- type input\euler003.txt | stack runghc euler003.hs