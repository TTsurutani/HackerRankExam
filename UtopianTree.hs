import Control.Applicative
import Control.Monad
import System.IO


main :: IO ()
main = do
    t_temp <- getLine
    let t = read t_temp :: Int
    forM_ [1..t] $ \a0  -> do
        n_temp <- getLine
        let n = read n_temp :: Int


getMultipleLines :: Int -> IO [String]

getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (x:xs)    
        return ret

-- type input\UtopianTree.txt | runghc UtopianTree.hs
-- https://www.hackerrank.com/challenges/utopian-tree
