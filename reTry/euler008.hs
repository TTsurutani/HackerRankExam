{--
Sample Input 0
2
10 5 (n k)
3675356291 (xs)
10 5
2709360626

Sample Output 0
3150
0
--}
import Data.Char
main :: IO()
main = do 
    _ : input <- lines <$> getContents
    -- ["10 5","3675356291","10 5","2709360626"]
    mapM_ print $ map (\(x,y) -> solve x y) $ (barasu input)

barasu :: [String] -> [(String, String)]
barasu [] = []
barasu (x:y:xs) =  (((words x)!! 1) , y ) : barasu xs

sep :: String -> String -> [String]
sep n xs 
    | length xs == string2Int n = [xs]
    | otherwise = take (string2Int n) xs : sep n (tail xs)

    -- |
-- >>> multi "67535"
-- 3150
multi :: String -> Int
multi xs = product $ map digitToInt xs

-- | 
-- >>> solve "5" "3675356291"
-- 3150
solve :: String -> String -> Int
solve k xs = maximum $ map multi $ sep k xs

string2Int :: String -> Int
string2Int = read    


-- https://www.hackerrank.com/contests/projecteuler/challenges/euler008
-- type input\euler008.txt | stack runghc euler008.hs