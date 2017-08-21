
main :: IO()
main = do
    _ : list <- lines <$> getContents
    let tlist = map words list
    -- [["2","2","3","2","5","3"],["3","2","5","3","11","1"]]
    let plist = map pairs tlist
    -- [[(2,2),(3,2),(5,3)],[(3,2),(5,3),(11,1)]]
    print $ plist

pairs :: [String] -> [(Int,Int)]
pairs [] = []
pairs (x:y:xs) = (read x, read y) : pairs xs

depairs :: [(Int,Int)] -> String
depairs = undefined

-- type input\ListsAndGCD.txt | stack runghc ListsAndGCD.hs
-- https://www.hackerrank.com/challenges/lists-and-gcd