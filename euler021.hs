primes :: [Integer]
primes = 2 : filter (null . tail . primeFactors)[3,5..]

primeFactors :: Integer -> [Integer]
primeFactors n = factor n primes

factor :: Integer -> [Integer] -> [Integer]
factor n (x:xs)
  | x * x > n = [n]
  | n `mod` x == 0 = x : factor (n `div` x) (x:xs)
  | otherwise = factor n xs