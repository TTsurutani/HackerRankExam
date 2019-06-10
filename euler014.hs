import Data.List (unfoldr)

colatz :: Integer -> [Integer] 
colatz = unfoldr f

f :: Integer -> Maybe (Integer,Integer)
f 0 = Nothing
f 1 = Just (1,0)
f n 
  | even n = Just (n, n `div` 2)
  | otherwise = Just (n, 3 * n + 1)