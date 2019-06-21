-- import Control.Arrow
import Data.Array.IArray

main :: IO ()
main = print 
       . maximum 
       . prods 
       . input =<< getContents

-- 入力をArrayに
input :: String -> Array (Int,Int) Int
input = listArray ((1,1),(20,20))
        . map read . words

-- 縦に、右肩下がりに、横に、右肩あがりに座標に変換する関数のリスト
senses :: [(Int, Int) -> (Int, Int)]
senses = [\(x,y)->(x+1,y),
          \(x,y)->(x+1,y+1),
          \(x,y)->(x,y+1),
          \(x,y)->(x+1,y-1) ]
{- 
senses = [(+1) *** id,  -- first (+1)
          (+1) *** (+1), 
          id *** (+1),  -- second (+1)
          (+1) *** (\n -> n - 1)]
 -}
-- インデックスがArrayの範囲内か否かを返す          
inArray :: Ix i => Array i e -> i -> Bool          
inArray a = inRange (bounds a)

-- 配列をとって、条件に合致した要素の積のリストを返す
prods :: Array (Int, Int) Int -> [Int]
prods a = [product xs |
                i <- range $ bounds a, -- 全インデックスを生成し一つづつ
                s <- senses, -- 4つの変換関数の一つを取り出し
                let is = take 4 $ iterate s i,　-- 基準となる座標を起点に同じ方向に変換を繰り返す
                all (inArray a) is, -- 生成された４つ組がすべて範囲内の場合のみ
                let xs = map (a!) is] -- 条件に合致した座標の値をArrayから取り出したリストを作り

-- type input\euler011.txt | stack runghc euler011.hs                        