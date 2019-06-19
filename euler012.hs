import Data.List

primes :: [Integer]
primes = 2 : filter (null . tail . primeFactors) [3,5..]

primeFactors :: Integer -> [Integer]
primeFactors = factors primes

factors :: [Integer] -> Integer -> [Integer]
factors (x:xs) n
  | x * x > n = [n]
  | n `mod` x == 0 = x : factors (x:xs) (n `div` x)
  | otherwise = factors xs n

triangles :: [Integer]
triangles = map (\x -> sum [1..x]) [1..] 

conv :: Integer -> Integer
conv = product . map ((+1) . genericLength) . group . primeFactors

ans :: Integer
ans = head $ dropWhile (( < 500) . conv) triangles