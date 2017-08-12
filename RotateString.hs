-- |
-- 5
-- abc
-- abcde
--abab
-- aaa
-- z
{-
main = do 
    temp <- getContents 
    let x:xs = lines temp
    let ys = map proc xs
    mapM_ print ys 
-}
main :: IO()
main = getContents >>=  mapM_ (output . proc) . tail . lines


rotate :: Int -> String -> String
rotate n xs = drop n xs ++ take n xs

-- |
-- >>> proc "abc"
-- ["bca","cab","abc"]

proc :: String -> [String]
proc xs = zipWith rotate [1..ln] (replicate ln xs)
          where ln = length xs

output :: [String] -> IO()
output [] = putStrLn ""
output (x:xs) = putStr x >> putStr " " >> output xs

-- type RotateString.txt | stack runghc RotateString.hs