import Data.Maybe
main :: IO()
main = do 
  _:list <- map (map read'.words).lines <$> getContents
  putStrLn . unwords . unpair . gcd' . map pairing $ list

read'::String->Int
read' = read  

-- フラットなリストを指数とのペアに置換
pairing :: [Int] -> [(Int,Int)]
pairing [] = []
pairing (x:y:xs) = (x,y) : pairing xs

-- 二つの数字のGCDを求める
wgcd :: [(Int,Int)] -> [(Int,Int)] -> [(Int,Int)]
wgcd [] _ = []
wgcd ((k,v):xs) ys 
  | isNothing x = wgcd xs ys
  | otherwise = (k , min v (fromJust x)) : wgcd xs ys
  where
    x = lookup k ys

-- 複数の数値を頭から順にGCDしていく
gcd' :: [[(Int,Int)]] -> [(Int,Int)]
gcd' [x] = x
gcd' (x:y:ys) = gcd' (wgcd x y : ys)

-- pairを回答形式に戻す
unpair :: [(Int,Int)] -> [String]
unpair [] = []
unpair (x:xs) = show (fst x) : show (snd x) : unpair xs

-- type input\ListsAndGCD.txt | stack runghc ListsAndGCD.hs
-- https://www.hackerrank.com/challenges/lists-and-gcd