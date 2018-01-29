main :: IO()
main = do
    _ :xs <- lines <$> getContents
    let list = makePair $ map (map string2Int . words) xs
    print list

string2Int :: String -> Int
string2Int = read    

makePair :: [[Int]] -> [(Int,[Int])]
makePair [] = []
makePair ([_,n]:list:xs) = (n,list):makePair xs

count :: [Int] -> [(Int,Int)]
count [] = []
count (a:as) = count' (a:as) [] 

--このロジックだと既存が先頭にないと足し込めない
--中腹にあるペアをkeyで特定して更新する機能が必要
--intMapとかが使えそうだが、使い方がわからない
count' :: [Int] -> [(Int,Int)]->[(Int,Int)]
count' [] [] = []
count' [] zs = zs
count' (x:xs) ((y,n):ys)
  | x == y    = count' xs ((y,n+1):ys)
  | otherwise = count' xs ((x,1):(y,n):ys)
count' (x:xs) [] = count' xs [(x,1)]   

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