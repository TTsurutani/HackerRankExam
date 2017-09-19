main :: IO()
main = do
    _:input<- lines <$> getContents
    -- ["0 0 1 1","1 1 2 2"]
    mapM_ (putStrLn . f . calc . findpoint) input
    -- [[2,2],[3,3]]

-- |
-- >>> f [2,2] 
-- "2 2"

f :: Show a => [a] -> String
f [x,y] = show x ++ " " ++ show y

-- |
-- >>> findpoint "0 0 1 1"
-- [0,0,1,1]
findpoint :: String -> [Int]
findpoint x = map string2Int $ words x

-- |
-- >>> calc [1,1,2,2]
-- [3,3]
calc :: Num a => [a] -> [a]
calc [px,py,qx,qy] = [2*qx - px , 2*qy - py]

string2Int :: String -> Int
string2Int = read

-- https://www.hackerrank.com/challenges/find-point
-- type input\FindthePoint.txt | stack runghc FindthePoint.hs
