main :: IO()
main = do
    _ : n :lst :xs <- lines <$> getContents
    print n
    print lst
    print xs

-- type input\FilterElements.txt | stack runghc FilterElements.hs
-- https://www.hackerrank.com/challenges/filter-elements