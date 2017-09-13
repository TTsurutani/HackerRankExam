import Data.List
main :: IO()
main = do
    [_ , xs , _ , ys ] <- Prelude.map words.lines <$> getContents
    output $ sort $ nub $ (\\) ys xs

output :: [String] -> IO()
output = Prelude.foldr (\ x -> (>>) (putStr x >> putStr " ")) (putStrLn "") 
-- output [] = putStrLn ""
-- output (x:xs) = putStr x >> putStr " " >> output xs

-- type input\MissingNumbers.txt | stack runghc MissingNumbers.hs
-- https://www.hackerrank.com/challenges/missing-numbers-fp

-- case01 expected
-- 3670 3674 3677 3684 3685 3695 3714 3720
-- case03 expected timeOutのみ問題。
-- 2437 2438 2442 2444 2447 2451 2457 2458 2466 2473 2479 2483 2488 2489 2510 2515 2517 2518

-- | リストに要素が含まれる数を返す
elements ::Eq a => a -> [a] -> Int
elements _ [] = 0
elements x (y:ys)
       | x == y    = elements x ys + 1
       | otherwise = elements x ys

-- | リストに含まれる要素を除去する
delelm :: Eq a => a -> [a] -> [a]
delelm _ [] = []
delelm x (y:ys)
      | x == y    = delelm x ys
      | otherwise = y:delelm x ys

-- | リストをキーとカウントのペアに変換
pairs :: Eq a => [a] -> [(a,Int)]
pairs [] = []
pairs (x:xs) = (x, elements x xs + 1) : pairs (delelm x xs)


-- | リストBにはあって、Aにはないもののリスト
func :: Eq a => [a] -> [a] -> [a]
func [] _ = []
func (x:xs) (y:ys)
        | x == y    = func xs ys
        | otherwise = y : func xs ys 