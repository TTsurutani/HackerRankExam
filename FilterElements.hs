main :: IO()
main = do
    _ : input <- lines <$> getContents
    print input



-- type input\FilterElements.txt | stack runghc FilterElements.hs
-- https://www.hackerrank.com/challenges/filter-elements