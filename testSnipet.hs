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

string2Int :: String -> Int
string2Int = read

-- type input\testSnipet.txt | stack runghc testSnipet.hs

