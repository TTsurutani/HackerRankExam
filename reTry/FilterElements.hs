import Data.List (sortOn,groupBy,sort)
import Data.Function (on)
main :: IO()
main = do
    _ :xs <- lines <$> getContents
    let list = makePair $ map (map string2Int . words) xs    
    mapM_ (putStrLn . unwords . map show . f') list

f' :: (Int,[Int]) -> [Int]
f'(k,list) 
 | null $ f (k,list) = [-1]
 | otherwise = f (k,list)

f :: (Int,[Int]) -> [Int]
f (k,list) = map snd
    .sort
    .map head
    .filter (\x -> k <= length x) 
    .groupBy ((==) `on` snd) 
    .sortOn snd
    .zip [0..] $ list

string2Int :: String -> Int
string2Int = read    

--入力から、個々の設問の入力のリストを作成
makePair :: [[Int]] -> [(Int,[Int])]
makePair [] = []
makePair ([_,n]:list:xs) = (n,list):makePair xs

--個々の設問から答え（リスト）を返す
--ペアのsndをcountする→結果をfilterしてfstのリストを返す
solve :: (Int,[Int]) -> [Int]
solve (x,ys)  
  | null list = [-1]
  | otherwise = map fst list
    where
      list = filter (\m -> snd m >= x) $ count [] ys

--蓄積関数を使って、数字とカウントのペアを作る
count :: [(Int,Int)] -> [Int] -> [(Int,Int)] 
count xs [] = xs
count xs (y:ys)
  | found y xs = count (add y xs) ys
  | otherwise = count (xs ++ [(y,1)]) ys

found :: Int -> [(Int,Int)] -> Bool
found _ [] = False
found x ((y,_):ls)
  | x == y = True
  | otherwise = found x ls

add :: Int -> [(Int,Int)] -> [(Int,Int)]
add k ((l,m):ls)
  | k == l = (k,m+1) : ls
  | otherwise = (l,m) : add k ls

-- type input\FilterElements.txt | stack runghc FilterElements.hs
-- https://www.hackerrank.com/challenges/filter-elements

{-- 
指定された回数以上、出現する要素を出現順に出力する
処理に必要なのはKとListのみ
Sample Input
3                   :test case count
9 2                 :list size & repetition count(=K)
4 5 2 5 4 3 1 3 4   :list (4*2 5*2 2*1 3*2 1*1) = List A
9 4
4 5 2 5 4 3 1 3 4
10 2
5 4 3 2 1 1 2 3 4 5 :list (5*2 4*2 3*2 2*2 1*2)

Sample Output
4 5 3
-1
5 4 3 2 1
--}