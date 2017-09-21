import Data.List hiding (map)
main :: IO()
main = do
  -- [ _ ,a,_,b] <- map (read::String->Integer) $ map words . lines <$> getContents
  [ _ ,a,_,b] <- map words . lines <$> getContents
  let x =  map (read::String->Integer) a
  let y =  map (read::String->Integer) b
  let w = x `intersect` y
  let z = (\\) x y
  print w
  print z
  --print $ gcd x y
 
mygcd :: Integer ->Integer -> Integer
mygcd a 0 = a
mygcd a b
   | b > a     = mygcd b a
   | otherwise = mygcd b c `mod` 1000000007
         where c  = a `mod` b

-- #case13 expected 809388299

-- https://www.hackerrank.com/challenges/huge-gcd-fp   
-- type input\HugeGCD.txt | stack runghc HugeGCD.hs
