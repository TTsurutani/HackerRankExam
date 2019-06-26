import Data.Array

main :: IO()
main = print . maximum . prods . input =<< getContents

input :: String -> Array (Int,Int) Int
input = listArray ((1,1),(20,20)) . map read . words

inArray :: Ix i => Array i e -> i -> Bool
inArray a = inRange (bounds a) 

fs :: [(Int,Int)->(Int,Int)]
fs = [\(x,y)->(x+1,y),
     \(x,y)->(x,y+1),
     \(x,y)->(x+1,y+1),
     \(x,y)->(x+1,y-1)]

prods a = [product xs |
                  r <- range $ bounds a,
                  f <- fs,
                  let ls = take 4 $ iterate f r,
                  all (inArray a) ls,
                  let xs = map (a!) ls]

-- type input\euler011.txt | stack runghc e11.hs 