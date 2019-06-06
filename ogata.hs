furui :: Integral a => [a] -> [a]
furui (x:xs) = x : furui (filter (\z -> z `mod` x /= 0) xs)

div2 :: Int -> Maybe Int
div2 x
  | x `mod`2 == 0 = Just $ x `div` 2
  | otherwise = Nothing

data Point = Point Double Double
instance Eq Point where
  Point x y == Point x' y' = x == x' && y == y'