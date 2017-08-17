import Control.Monad

main ::IO()
main = do
    _:list:_:xs <- lines <$> getContents
    let subsetlist = subset $ map (read::String->Int) $ words list
    let sumlist = map sum subsetlist
    let target = map (read::String->Int) xs
--    print sumlist
--    print target
    forM_ target (\x -> print (filter (>= x) sumlist))

-- |
-- >>> subset [1,2,3]
-- [[1],[2],[3],[1,2],[1,3],[2,3],[1,2,3]]
subset :: [a] -> [[a]]
subset [] = [[]]
subset (x:xs) =  map ([x] ++) (subset xs) ++ subset xs



-- type SubsetSum.txt | stack runghc SubsetSum.hs