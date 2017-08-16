main ::IO()
main = do
    _:list:_:xs <- lines <$> getContents
    let subsetlist = subset $ map (read::String->Int) $ words list
    let sumlist = map sum subsetlist
    print sumlist
    print $ map (read::String->Int) xs

-- |
-- >>> subset [1,2,3]
-- [[1],[2],[3],[1,2],[1,3],[2,3],[1,2,3]]
subset :: [a] -> [[a]]
subset [] = [[]]
subset (x:xs) =  map ([x] ++) (subset xs) ++ subset xs

-- type SubsetSum.txt | stack runghc SubsetSum.hs