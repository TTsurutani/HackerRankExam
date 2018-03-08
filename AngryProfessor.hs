main :: IO()
main = do 
    _ : input <- lines <$> getContents
    print  $ map (map string2Int.words) $ pair input

pair :: [a] -> [[a]]
pair [] = []    
pair (x:y:xs) = [x,y] : pair xs

string2Int :: String -> Int
string2Int = read

-- type input\AngryProfessor.txt | stack runghc AngryProfessor.hs
-- https://www.hackerrank.com/challenges/angry-professor/problem