main::IO()
main = do 
    [a,n] <- words <$> getContents
    let x = concat $ replicate (stringToInt n) a
    print x
    print $ sumString x

stringToInt :: String -> Int
stringToInt = read::String->Int
stringToInteger :: String -> Integer
stringToInteger = read::String->Integer

sumString :: String -> Integer
sumString = foldr ((+) . stringToInteger) 0


-- type SuperDigit.txt | stack runghc SuperDigit.hs
-- https://www.hackerrank.com/challenges/super-digit

