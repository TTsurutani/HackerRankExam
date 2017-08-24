import Data.Bits

main :: IO ()
main = do
  l <- readLn
  r <- readLn
  print $ maxXor l r

maxXor :: Int -> Int -> Int
maxXor l r = maximum 
             $ map (uncurry xor) [(x,y) | x <- [l..r],y <- [l..r],x <= y]

-- maxXor l r = maximum 
--             $ map (\(x,y) -> xor x y) [(x,y) | x <- [l..r],y <- [l..r],x <= y]             
  

-- map (\(x,y) -> xor x y) [(x,y) | x <- [10..15],y <- [10..15],x <= y]
-- https://www.hackerrank.com/challenges/maximizing-xor
-- type input\MaximizingXOR.txt | stack runghc MaximizingXOR.hs