prime :: [Integer]
prime = sieve [2..]

sieve :: [Integer] -> [Integer]
sieve (x:xs) = x : sieve xs'
   where
    xs' = filter ((/= 0).(`mod` x )) xs