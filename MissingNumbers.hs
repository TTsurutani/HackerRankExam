import Data.List(sort,nub)

main :: IO()
main = do
  [_,a,_,b] <- map words . lines <$> getContents
  let ans = unwords . nub . sort . solve a $ b
  putStr ans

solve :: Eq a => [a] -> [a] -> [a]
solve [] ys = ys
solve (x:xs) ys = solve xs (filter' x ys)

filter' :: Eq a => a -> [a] -> [a]
filter' _ [] = []
filter' x (y:ys) 
  | x == y = ys
  | otherwise = y : filter' x ys

-- type input\MissingNumbers.txt | stack runghc MissingNumbers.hs
-- https://www.hackerrank.com/challenges/missing-numbers-fp

-- case01 expected
-- 3670 3674 3677 3684 3685 3695 3714 3720
-- case03 expected timeOutのみ問題。
-- 2437 2438 2442 2444 2447 2451 2457 2458 2466 2473 2479 2483 2488 2489 2510 2515 2517 2518
