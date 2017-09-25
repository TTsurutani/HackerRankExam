main :: IO()
main = do
  _ : xs <- lines <$> getContents
  mapM_ print $ map string2Int xs


string2Int :: String -> Int
string2Int = read

output :: [String] -> IO()
output = Prelude.foldr (\ x -> (>>) (putStr x >> putStr " ")) (putStrLn "") 

  -- type input/euler001.txt | stack runghc euler001.hs
-- https://www.hackerrank.com/contests/projecteuler/challenges/euler001