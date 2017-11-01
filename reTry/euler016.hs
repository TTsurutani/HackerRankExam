import Data.Char
main :: IO()
main = do 
    _:input <- lines <$> getContents
    mapM_ (print.solve.string2Int) input

solve :: Int -> Int
solve n = sum $ map digitToInt (show $ 2^n) 

string2Int :: String -> Int
string2Int = read

-- https://www.hackerrank.com/contests/projecteuler/challenges/euler016
-- type input\euler016.txt | stack runghc euler016.hs