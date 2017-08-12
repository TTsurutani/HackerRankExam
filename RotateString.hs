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
main = getContents >>=  mapM_ (print . proc) . tail . lines


rotate :: Int -> String -> String
rotate n xs = drop n xs ++ take n xs

-- |
-- >>> proc "abc"
-- ["bca","cab","abc"]

proc :: String -> [String]
proc xs = zipWith rotate [1..ln] (replicate ln xs)
          where ln = length xs

{-- 
output :: [String] -> IO()
output (x:xs) = do 
                 putStr x
                 output xs
--}                 