main :: IO()
main = do
   [ _ ,a,_,b] <- map (words.(read::String->Int)) . lines <$> getContents
   print a
   print b

-- https://www.hackerrank.com/challenges/huge-gcd-fp   
-- type input\HugeGCD.txt | stack runghc HugeGCD.hs
