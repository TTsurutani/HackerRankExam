import Control.Parallel
import Data.Word

main ::IO()
main = print soln
    where
        s1 = solve [2..500000]
        s2 = solve [500001..1000000]
        soln = s2 `par` (s1 `pseq` max s1 s2)


solve :: [Word32] -> (Int, Word32)
solve  = foldl pmax (1,1) 


pmax :: (Int, Word32) -> Word32 -> (Int, Word32)
pmax x n = x `max` (collatzLen 1 n, n)








collatzLen :: Int -> Word32 -> Int
collatzLen len 1 = len
collatzLen len n = collatzLen (len + 1) $ nextCoratz n

nextCoratz :: Integral a => a -> a
nextCoratz n 
  | even n = n `div` 2
  | otherwise = 3*n + 1



