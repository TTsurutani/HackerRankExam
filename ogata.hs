primes :: [Integer]
primes = 2 : sieve [3,5..]

sieve :: [Integer] -> [Integer]
sieve (x:xs) = x : (sieve $ filter ((/= 0) . (`mod` x))  xs)

div2 :: Int -> Maybe Int
div2 x
  | x `mod`2 == 0 = Just $ x `div` 2
  | otherwise = Nothing

data Point = Point Double Double
instance Eq Point where
  Point x y == Point x' y' = x == x' && y == y'