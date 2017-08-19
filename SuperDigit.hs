import Data.Char
main::IO()
main = do 
    [a,n] <- words <$> getContents
    -- a = "148" n = "3"
    let x = toInteger(stringToInt n) * sumString a
    putStrLn $ superDigit (show x)

stringToInt :: String -> Int
stringToInt = read::String->Int

charToInt :: Char -> Int
charToInt x = ord x - 48

sumString :: String -> Integer
sumString = foldr ((+) . toInteger . charToInt) 0

superDigit :: String -> String
superDigit x 
        | length x == 1 = x
        | otherwise     = superDigit $ show $ sumString x

{--
sumString [] = 0
sumString (x:xs) = toInteger (charToInt x) + sumString xs

-- type SuperDigit.txt | stack runghc SuperDigit.hs
-- https://www.hackerrank.com/challenges/super-digit

 --}