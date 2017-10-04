main :: IO()
main = do
    _ : xs <- lines <$> getContents
    let list = map string2Int xs
    mapM_ (print . solve) list

f n = (sum [1..n])^2
g n = sum $ map (^2) [1..n]
solve n = f n - g n

string2Int :: String -> Integer
string2Int = read 

-- https://www.hackerrank.com/contests/projecteuler/challenges/euler006
-- type input\euler006.txt | stack runghc euler006.hs