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
import Data.List
import Data.Char
main :: IO ()
main = getContents >>= print. (\[n, k] -> superDigit ((read k) * (getSumStr n))). words

superDigit n
  | n < 10 = n
  | otherwise = superDigit (getSum n)

getSum 0 = 0
getSum n = n`rem`10 + getSum (n`div`10)

getSumStr [] = 0
getSumStr (x:xs) = (ord x - ord '0') + getSumStr xs
 --}

{--
sumString [] = 0
sumString (x:xs) = toInteger (charToInt x) + sumString xs

-- type SuperDigit.txt | stack runghc SuperDigit.hs
-- https://www.hackerrank.com/challenges/super-digit

 --}