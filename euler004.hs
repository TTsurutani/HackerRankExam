isPalin :: Integer -> Bool
isPalin x = x' == reverse x'
  where x' = show x

list :: [Integer]
list = [x*y |x <- [999,998..100], y <- [998,997..100]]