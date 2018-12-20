{- import Data.Char (digitToInt)

main :: IO()
main = do
    xs <- getContents
    {--
    -- linesで一続きのStringを、行単位のStringのリストに変換
    let strList = lines xs
    -- ["10 20","30 40","50 60"]
    --　wordsで個々のstringを分割して行単位のリストのリストに
    let sep = map words strList
    -- [["10","20"],["30","40"],["50","60"]]
    let ans = map (map string2Int) sep
    -- map(map f)はリストの入れ子の中身にfを適用するため
    -- print $ map (map string2Int) (map words (lines xs))
    --}
    --print $ map (map string2Int . words) $ lines xs
    print . map (map string2Int . words) . lines $ xs

sieve :: [Int] -> [Int]
sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

primes :: [Int]
primes = sieve [2..]

string2Int :: String -> Integer
string2Int = read

-- type input\testSnipet.txt | stack runghc testSnipet.hs



judge :: Integer -> Bool
juge 1 = True
judge n = (== n) . sum . map read . split (length n' `div` 2) $ n' 
  where
    n' = show $ n^2

split n str = [take n str,drop n str]   
 -}

import Data.List (isInfixOf) 
--f :: Show a => [Int] -> [a] -> IO b
f :: Show a => [Int] -> [a] -> IO ()
f (x:xs) ls = do 
               print $ ls !! x
               f xs ls
f [] _ = return ()


sorted :: Ord a =>  [a] -> Bool
sorted xs = and $ zipWith (<) xs (tail xs)

--data Code = 1 | 2 | 8 | 9

valid :: String -> Bool
valid xs =  xs == "1289" || xs == "189"

valid' :: [String] -> [String]
valid' xs
  | all valid xs = ["All_OK"]
  | otherwise = map valid'' xs    

valid'' :: String -> String
valid'' xs
  | not.sorted $ xs = "not sorted"
  | any (`notElem` "1289") xs = "invalid code"
  | otherwise = "ok"

valid''' :: String -> Bool
valid''' ls = h == '1' && l == '9' && ll == '8' && (r `isInfixOf` ['2'..])
         where 
          h = head ls
          l:ll:xs = reverse ls
          r = reverse xs

pre [] = []
pre (x:xs)
  | x == "" = pre xs
  | otherwise = x : pre xs          