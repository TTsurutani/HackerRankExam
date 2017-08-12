import Data.List
main :: IO()
main = do
    [_ , xs , _ , ys ] <- map words.lines <$> getContents
    print $ nub xs
    print $ nub ys

-- type MissingNumbers.txt | stack runghc MissingNumbers.hs    