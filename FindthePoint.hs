main :: IO()
main = do
    _:input<- lines <$> getContents
    -- ["0 0 1 1","1 1 2 2"]
    print $ map words input
    -- [["0","0","1","1"],["1","1","2","2"]]


string2Int :: String -> Int
string2Int = read

    -- https://www.hackerrank.com/challenges/find-point
-- type input\FindthePoint.txt | stack runghc FindthePoint.hs
