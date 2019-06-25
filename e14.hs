{- 
import Data.List   

problem_14 = j 1000000

f :: Int -> Integer -> Int   
f k 1 = k   
f k n = f (k+1) 
        $ if even n then div n 2
                    else 3*n + 1 

-- 二項でsnd（おそらくチェーンの長さ）の大きい方を返す
g x y = if snd x < snd y then y else x 

h x n = g x (n, f 1 n) 

j n = fst $ foldl' h (1,1) [2..n-1]
 -}

import Data.List (maximumBy)
import Data.Function (on)

answer :: Integer
answer = (head . maximumBy (compare `on` length) . map collatz) [1..1000000]
  where 
    collatz 1 = [1]
    collatz n
      | even n = n : collatz (n `quot` 2)
      | otherwise = n : collatz (3 * n + 1)