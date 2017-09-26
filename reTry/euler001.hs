main :: IO()
main = do
  _ : xs <- lines <$> getContents
  mapM_ (print.f.string2Int) xs

f :: Integer -> Integer
f x = g 3 3 x + g 5 5 x - g 15 15 x
-- f x = sum [a | a <- [1 .. x-1], a `mod` 3 == 0 || a `mod` 5 == 0]

-- 等差数列の和
-- a 初期値　d 公差 n 最終（ここから x 項数を求める）
g :: Integer -> Integer -> Integer -> Integer
g a d n = (x*(2*a + d*(x-1))) `div` 2
  where x = (n-1) `div` d

string2Int :: String -> Integer
string2Int = read

output :: [String] -> IO()
output = Prelude.foldr (\ x -> (>>) (putStr x >> putStr " ")) (putStrLn "") 

  -- type input/euler001.txt | stack runghc euler001.hs
-- https://www.hackerrank.com/contests/projecteuler/challenges/euler001