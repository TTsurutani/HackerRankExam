{--
Sample Input 0
2
10 5 (n k)
3675356291
10 5
2709360626

Sample Output 0
3150
0
--}
import Data.Char
main :: IO()
main = do 
    [xs] <- lines <$> getContents
    print $ solve "13" xs

sep :: String -> String -> [String]
sep n xs 
    | length xs == string2Int n = [xs]
    | otherwise = take (string2Int n) xs : sep n (tail xs)
-- | 切り出した要素に対して積を計算する
-- >>> multi "67535"
-- 3150
multi :: String -> Int
multi xs = product $ map digitToInt xs

-- | kと数字をとって、答えを返す
-- >>> solve "5" "3675356291"
-- 3150
solve :: String -> String -> Int
solve n xs = maximum $ map multi $ sep n xs

string2Int :: String -> Int
string2Int = read    


-- https://www.hackerrank.com/contests/projecteuler/challenges/euler008
-- type input\euler008.txt | stack runghc euler008.hs