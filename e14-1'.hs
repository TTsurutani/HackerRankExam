

ans :: Integer
ans = solve 1000000


-- 関数j
solve :: Integer -> Integer
solve n = snd $ foldl pmax (1,1) [2..n-1]



-- 関数h
pmax :: (Int, Integer) -> Integer -> (Int, Integer)
pmax p n = p `max` (collatzLen 1 n,n)

-- 関数gはペアの順序を変えるとmaxで代用できるので不要になる

-- 関数f
collatzLen :: Int -> Integer -> Int
collatzLen len 1 = len
collatzLen len n = collatzLen (len + 1) $ nextCoratz n

-- 関数f の一部
nextCoratz :: Integral a => a -> a
nextCoratz n 
  | even n = n `div` 2
  | otherwise = 3*n + 1