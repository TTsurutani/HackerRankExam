main :: IO()
main = do
  _ : xs <- lines <$> getContents
  mapM_ (print.f.string2Int) xs

f :: Integer -> Integer
f x = sum [a | a <- [1 .. x-1], a `mod` 3 == 0 || a `mod` 5 == 0]

string2Int :: String -> Integer
string2Int = read

output :: [String] -> IO()
output = Prelude.foldr (\ x -> (>>) (putStr x >> putStr " ")) (putStrLn "") 

  -- type input/euler001.txt | stack runghc euler001.hs
-- https://www.hackerrank.com/contests/projecteuler/challenges/euler001