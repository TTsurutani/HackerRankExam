import Text.Printf (printf)

-- This function should return a list [area, volume].


-- |
-- >>> solve 1 4 [1,2,3,4,5] [6,7,8,9,10]
-- [2435300.3,26172951168940.8]

--solve :: Int -> Int -> [Int] -> [Int] -> [Double]
--solve l r a b = [area , volume]
--solve l r a b = undefined

-- a1/(b1+1)*x^(b1+1)
-- area :: Int -> Int -> [Int] -> [Int] -> Double
--area l r a b = areaCalc r a b - areaCalc l a b

areaCalc :: Int -> [Int] -> [Int] -> Double
areaCalc n as bs = sum (zipWith (f n) as bs)

f :: Int -> Int -> Int -> Double
f n a b = (ax/(bx+1))*(nx**(bx+1))
    where
        ax = fromIntegral a
        bx = fromIntegral b
        nx = fromIntegral n

volume :: Int -> Int -> [Int] -> [Int] -> Double
volume l r a b = areaCalc r a b - areaCalc l a b


--Input/Output
{--
main :: IO ()
main = getContents >>= mapM_ (printf "%.1f\n"). 
                       (\[a, b, [l, r]] -> solve l r a b). 
                       map (map read. words). lines
--}
-- https://www.hackerrank.com/challenges/area-under-curves-and-volume-of-revolving-a-curv
-- type input\AreaUndercurves.txt | stack runghc AreaUndercurves.hs
                       