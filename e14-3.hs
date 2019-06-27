import Data.Array
import Data.List
import Data.Ord (comparing)

main :: IO()
main = print 
       . fst 
       . maximumBy (comparing snd) 
       . assocs 
       . syrs $ 1000000

-- assocs :: Ix i => Array i e -> [(i, e)] アレイをリスト変換

syrs n = array
    where 
      array = listArray (1,n) $ 0 : map syr [2..n]
      syr x
        | nc <= n   = 1 + array ! nc
        | otherwise = 1 + syr nc
        where 
          nc = nextCoratz x

nextCoratz :: Integral a => a -> a
nextCoratz n 
  | even n = n `div` 2
  | otherwise = 3*n + 1

