
import Data.Char
multi :: String -> Int
multi xs = product $ map digitToInt xs


-- https://www.hackerrank.com/contests/projecteuler/challenges/euler008
-- type input\euler008 | stack runghc euler008.hs