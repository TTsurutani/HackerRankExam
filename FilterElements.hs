main :: IO()
main = do
    _ : n :lst :xs <- lines <$> getContents
    print n
    print lst
    print xs

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