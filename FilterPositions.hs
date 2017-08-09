f :: [Int] -> [Int]
f lst = [ y | (x , y) <- zip [1..] lst , even x]

-- This part deals with the Input and Output and can be used as it is. Do not modify it.
main :: IO()
main = do
   inputdata <- getContents
   mapM_ print. f. map read. lines $ inputdata

-- fst snd filterを使う   