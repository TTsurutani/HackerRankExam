import Data.List
main :: IO()
main = do
    [_ , xs , _ , ys ] <- map words.lines <$> getContents
    print  xs
    print  ys

elements ::Eq a => a -> [a] -> Int
elements _ [] = 0
elements x (y:ys)
       | x == y    = elements x ys + 1
       | otherwise = elements x ys

counts :: [a] -> [(a,Int)]
counts [] = []



-- type MissingNumbers.txt | stack runghc MissingNumbers.hs    