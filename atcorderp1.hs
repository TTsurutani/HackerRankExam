{--
main::IO()
main = do 
    a <- string2Int <$> getLine
    [b,c] <- mapM string2Int $ words <$> getLine
    d <- getLine
    let x = a + b + c 
    return $ show x ++ d

string2Int :: String -> Int
string2Int = read
--}


import Data.Char
nbDig :: Int -> Int -> Int
nbDig n d = sum $ map ((inCount d . show) . (\ x -> x * x)) [1 .. n]

inCount :: Int -> String -> Int
inCount _ [] = 0
inCount x (y:ys)
  | intToDigit x == y = inCount x ys + 1
  | otherwise = inCount x ys

sumJusts :: [Maybe Integer] -> Maybe Integer
sumJusts xs = g.sum $ fmap f xs

f :: Maybe a -> a
f (Just x) = x

g :: a -> Maybe a
g = Just

opposite :: Num a => a -> a
opposite x = x * (-1)