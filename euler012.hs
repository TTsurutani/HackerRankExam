{- 
primes :: [Integer]
primes = 2 : filter (null . tail . primeFactors) [3,5..]

primeFactors :: Integer -> [Integer]
primeFactors = factors primes 
 -}
factors' :: [Integer] -> Integer -> [Integer]
factors' (x:xs) n
  | n == x = [x]
  | n `mod` x == 0 = factors' (x:xs) (n `div` x)
  | otherwise = factors' xs n

triangles :: [Integer]
triangles = map (\x -> sum [1..x]) [1..] 

nub :: Ord a => [a] -> [a]
nub [] = []
nub (x:xs) = x : nub (filter (/= x) xs)