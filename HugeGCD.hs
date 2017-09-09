main :: IO()
main = do
  -- [ _ ,a,_,b] <- map (read::String->Integer) $ map words . lines <$> getContents
  [ _ ,a,_,b] <- map words . lines <$> getContents
  let x =  product $ map (read::String->Integer) a
  let y =  product $ map (read::String->Integer) b
  print $ gcd x y
 
mygcd :: Integer ->Integer -> Integer
mygcd a 0 = a
mygcd a b
   | b > a     = mygcd b a
   | otherwise = mygcd b c
         where c  = a `mod` b

-- https://www.hackerrank.com/challenges/huge-gcd-fp   
-- type input\HugeGCD.txt | stack runghc HugeGCD.hs
