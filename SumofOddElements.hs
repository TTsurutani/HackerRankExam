main = do
   inputdata <- getContents
   print $ f $ map (read :: String -> Int) $ lines inputdata

f arr = sum $ filter odd arr
