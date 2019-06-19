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

--primes :: [Int]
--primes = sieve [2..]

string2Int :: String -> Int
string2Int = read    

-- https://www.hackerrank.com/contests/projecteuler/challenges/euler003
-- type input\euler003.txt | stack runghc euler003.hs



primes :: [Int]
primes = 2 : filter (null . tail . factor primes) [3,5..]
-- null.tailはリストの要素が一つか、の判定
-- (== 1).lengthと等価
-- 素因数分解して要素が一つ＝自分自身だけのもの、という条件でfilter

-- 与えられた数の素因数（primeFactor)のリストを返す
primeFactors :: Int -> [Int]
primeFactors = factor primes

-- 与えられたリストの要素を使った因数分解
-- リストが素数の集合の場合は素因数分解になる
-- nは割れたら因数としてリストに追加し、同じリストを渡して、割った数を喰わせる
-- 割れなければ因数側から外して、残りの要素でリトライ
-- 今回の場合、リストは素数全体であるので、対象は必ず素因数分解される
--　自分自身以外因数がない、というのが一行目のガード？
--　ルートの自分自身が因数の最大値であるので、それを超えた自身で自分自身が素因数という意味か？
-- 停止条件は
factor :: Integral a => [a] -> a ->  [a]
factor (x:xs) n
    | x * x > n        = [n]
    | n `mod` x == 0 = x : factor  (x:xs) (n `div` x)
    | otherwise      =     factor xs n 

problem_3 :: Int        
problem_3 = last (primeFactors 600851475143)

diving :: Integral t => t -> t -> t
diving x n
  | x == n       = x
  | x `mod` n == 0 = diving (x `div` n) 2
  | otherwise    = diving x (n+1)
