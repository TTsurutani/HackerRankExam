import Text.Printf (printf)

-- This function should return a list [area, volume].
-- aは基数、bは累乗のリスト lとrはxの値。結果は2行に出力
-- ax^b + ・・・・
solve :: Int -> Int -> [Int] -> [Int] -> [Double]
solve l r a b = forM [l,r] sum $ zipWith func a b l
      where
        func (x:xs) (y:ys) = x      

--Input/Output.
main :: IO ()
main = getContents >>= mapM_ (printf "%.1f\n"). 
                       (\[a, b, [l, r]] -> solve l r a b). 
                       map (map read. words). lines

-- https://www.hackerrank.com/challenges/area-under-curves-and-volume-of-revolving-a-curv
-- type input\AreaUndercurves.txt | stack runghc AreaUndercurves.hs
                       