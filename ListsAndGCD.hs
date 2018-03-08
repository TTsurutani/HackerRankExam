
main :: IO()
main = do
    _ : list <- lines <$> getContents
    let tlist = map words list
    -- [["2","2","3","2","5","3"],["3","2","5","3","11","1"]]
    let plist = map pairs tlist
    -- [[(2,2),(3,2),(5,3)],[(3,2),(5,3),(11,1)]]
    print $ map (map barasu) plist
    {-- [
        [[2,2],[3,3],[5,5,5]],
        [[3,3],[5,5,5],[11]],
        [[2,2],[3,3,3],[5,5,5,5],[7,7,7,7,7,7],[19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19]],[[3,3,3,3,3,3,3,3,3,3],[5,5,5,5,5,5,5,5,5,5,5,5,5,5,5]]]
    --}
barasu :: (Int,Int) -> [Int]
barasu (x,y) = replicate y x






pairs :: [String] -> [(Int,Int)]
pairs [] = []
pairs (x:y:xs) = (read x, read y) : pairs xs

depairs :: [(Int,Int)] -> String
depairs = undefined

-- type input\ListsAndGCD.txt | stack runghc ListsAndGCD.hs
-- https://www.hackerrank.com/challenges/lists-and-gcd