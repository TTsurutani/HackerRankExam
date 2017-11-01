main :: IO()
main = do 
    _:input <- lines <$> getContents
    mapM_ print input

--与えられた数字n(<41)までの[2..n]の要素で、n以上の数値を順次割っていく
--除算結果のリスト[Bool]のandがTrueになったところで終了

--与えられたリストの要素で、引数の数字を順次割って、結果リストを得る
-- judge 10 2520
-- [True,True,True,True,True,True,True,True,True]
judge :: Int -> Int-> Bool
judge num target = not $ all (divable target) [2 .. num]
--takeWhileするために結果を逆転させている。超付け焼刃的。

divable :: Int -> Int -> Bool
divable target n
   | target `mod` n == 0 = True
   |otherwise            = False

-- https://www.hackerrank.com/contests/projecteuler/challenges/euler005
-- type input\euler005.txt | stack runghc euler005.hs