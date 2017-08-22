import Data.List
main :: IO()
main = do
    [_ , xs , _ , ys ] <- map words.lines <$> getContents
    print $ pairs xs
    print $ pairs ys

-- 単純にリストの差分をとったうえで、nubすればいい


-- | リストBにはあって、Aにはないもののリスト
func :: Eq a => [a] -> [a] -> [a]
func [] _ = []
func (x:xs) (y:ys)
        | x == y    = func xs ys
        | otherwise = y : func xs ys 

output :: [String] -> IO()
output [] = putStrLn ""
output (x:xs) = putStr x >> putStr " " >> output xs

-- type input\MissingNumbers.txt | stack runghc MissingNumbers.hs
-- https://www.hackerrank.com/challenges/missing-numbers-fp

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