import Data.Char
main :: IO()
main = do 
    list <- unlines . map (map conv) . lines <$> getContents
    putStrLn list


conv :: Char -> Char
conv ',' = ','
conv ' ' = ' '
conv x =  intToDigit . (64 `subtract`) . ord . toUpper $ x

-- 