main :: IO()
main = do
    _:xs <- lines <$> getContents
    putStrLn $ take 10 $ show $ sum $ map string2Int xs

string2Int = read    
string2Int :: String -> Integer

-- https://www.hackerrank.com/contests/projecteuler/challenges/euler013
-- type input\euler013.txt | stack ghc euler013.hs