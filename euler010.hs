main :: IO()
main = do
    _:xs <- lines <$> getContents
    let input = map string2Int xs
    mapM_ (print . sum . (\ n -> takeWhile (<= n) primes)) input

sieve :: [Int] -> [Int]
sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

primes :: [Int]
primes = sieve [2..]

string2Int :: String -> Int
string2Int = read    

-- https://www.hackerrank.com/contests/projecteuler/challenges/euler010/problem
-- type input\euler010.txt | stack runghc euler010.hs