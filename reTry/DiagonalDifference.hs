main :: IO()
main = do
  _ : list <- map (map read' . words) . lines <$> getContents
  print $ abs $ diag (reverse list) - diag list
  
read' :: String->Int
read' = read

diag :: [[Int]] -> Int
diag = sum . map (\(x,y) -> y!!x) . zip [0..] 

-- type input/DiagonalDifference.txt | stack runghc DiagonalDifference.hs