-- | combination
comb :: Int -> [a] -> [[a]]
comb 0 _ = [[]]
comb _ [] = []
comb n (x:xs) = map (x:) (comb (n-1) xs) ++ comb n xs

-- mkList n = takeWhile (< n) $ map (^2) [1..]


list :: (Eq t, Enum t, Num t) => t -> t -> [(t, t, t)]
list n m = [(x,y,z) | x <- [1..n], y <- [1..n] , z <- [1..n] , x*x + y*y == z*z, x + y + z == m]

pita = head [(x,y,z) | x <- target, y <- target, z <- target
                   , x + y == z
                   ,sqrt x + sqrt y + sqrt z == 1000
                   , x > y , y > z]
target = map (^2) [1..1000000]                   