fact :: Int -> Integer
fact 0 = 1
fact n = fromIntegral n * fact (n-1)

combination :: Int -> Int -> Integer
n `combination` k = fact n `div` (fact (n-k) * fact k)

pascal :: [Integer]
pascal = [n `combination` k | n <- [0..], k <- [0..n]]

-- pascalの有限個の要素を評価する要素の数
tri :: Int -> Int
tri n = n * (n+1) `div` 2

countInPascal :: Int -> Int
countInPascal a = length 
                  . filter (== fromIntegral a) 
                  $ take (tri (a+1)) pascal

main :: IO ()
main = for_ [2..3003] $ \a ->
  let n = countInPascal a
   in putStrLn $ "N(" ++ show a ++ ") = " ++ show n                  