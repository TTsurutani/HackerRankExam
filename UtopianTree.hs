import Control.Applicative
main :: IO()
main = do
   _ : input <- lines <$> getContents
   let list = map (read::String->Int) input
   mapM_ (print . utopian) list

utopian :: Int -> Int   
utopian 0 = 1
utopian n
    | odd n = utopian (n - 1) * 2
    | otherwise = utopian (n - 1) + 1

-- type input\UtopianTree.txt | runghc UtopianTree.hs
-- https://www.hackerrank.com/challenges/utopian-tree
