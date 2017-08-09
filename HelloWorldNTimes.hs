import Control.Monad
main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    replicateM_ n $ putStrLn "Hello World"

    -- mapM_ putStrLn $ replicate n "Hello World"