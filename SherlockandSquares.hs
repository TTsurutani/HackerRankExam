main :: IO()
main = do
    _:input <- lines <$> getContents
    let xxs = map (map (read :: String -> Int) . words) input -- [[3,9],[17,24]]
    print  xxs

reduce :: [Int] -> Int
reduce [x,y] = length $ takeWhile (<=y) $ dropWhile (<=x) list
  where
    list = map (^2) [1..] 

-- https://www.hackerrank.com/challenges/sherlock-and-squares/problem
-- type input\SherlockandSquares.txt | stack runghc SherlockandSquares.hs