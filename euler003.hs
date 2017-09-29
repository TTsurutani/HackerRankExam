main :: IO()
main = do
    _:list <- mapM string2Int.lines <$> getContents
    print list

string2Int :: String -> Integer
string2Int = read    

-- https://www.hackerrank.com/contests/projecteuler/challenges/euler003
-- type input\euler003.txt | stack runghc euler003.hs