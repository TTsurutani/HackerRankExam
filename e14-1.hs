import Data.List

ans :: Integer
ans = j 1000000

-- n以下のコラッツ数列の最長の長さを返す
-- ペアは所与の数値ｎとそのコラッツ数列の長さを表す
-- n=1のとき、すなわち(1,1)を初期値に、順次ペアのうちコラッツ数列の長い方を返す関数hで畳み込んだ結果のペアのfstが長さ
j :: Integer -> Integer
j n = fst $ foldl' h (1,1) [2..n-1]

-- gの第二引数は与えられた値nと、そのコラッツ数列の長さを返す関数のペア
-- 結果的に関数hは、これまでの最長のペアと新しいｎを比較して長い方を返す関数
h :: (Integer, Int) -> Integer -> (Integer, Int)
h x n = g x (n, f 1 n)

-- ペアのsndを比較して大きい方のペアを戻す（勝ち抜きのため）
g :: Ord a => (a1, a) -> (a1, a) -> (a1, a)
g x y = if snd x < snd y then y else x   

-- 第二引数を用いて次のコラッツ数を計算
-- それも用いて第一引数に＋１して再帰
-- ｋは増えていき最後１になると終わる。ということは返すのは深さ
-- 要するにコラッツ数が１になるまで深さを引き回して計算する関数
f :: Int -> Integer -> Int   
f k 1 = k   
f k n = f (k+1) 
        $ if even n then div n 2 else 3*n + 1