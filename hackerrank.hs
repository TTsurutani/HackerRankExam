gcd' :: Integral a => a -> a -> a
gcd' m n | n `mod` m == 0 = m
         | otherwise = gcd' n (n `mod` m)

fact :: Int -> Int
fact 0 = 1
fact n = n * fact (n-1)

rotate :: Int -> String -> String
rotate n xs = drop n xs ++ take n xs

-- |
-- >>> proc "abc"
-- ["bca","cab","abc"]

proc :: String -> [String]
proc xs = zipWith rotate [1..ln] (replicate ln xs)
          where ln = length xs
      