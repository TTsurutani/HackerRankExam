main :: IO()
main = do
    _ : xs <- lines <$> getContents
    -- ["1","2","3","4","5"]
    mapM_ (print . penta . (read :: String -> Int)) xs

-- 頂点の数 n = 頂点の数(n-1) + (n-1)*5
-- 重複するdotの数 = n=1,2 zero n>3 n + n*(n-3)

penta :: Int -> Int
penta 1 = 1
penta 2 = 5
penta n = summit (n - 1) + (n - 1)*5 - (n + n*(n-3))

summit :: Int -> Int
summit 1 = 1
summit 2 = 5
summit n = summit (n - 1) + 5*(n - 1)

-- type input\PentagonalNumbers.txt | stack runghc PentagonalNumbers.hs

-- https://www.hackerrank.com/challenges/pentagonal-numbers
