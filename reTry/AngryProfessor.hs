main :: IO()
main = do 
  _:list <- map (map (read::String->Int) . words) . lines <$> getContents
  -- [[4,3],[-1,-3,4,2],[4,2],[0,-1,2,1]]
  mapM_ putStrLn . decode $ list

decode :: [[Int]] -> [String]
decode [] = []
decode ([_,k]:xs:rest) = f k xs : decode rest

f :: (Num a, Ord a) => Int -> [a] -> String
f k xs = if f' then "YES" else "NO"
           where
             f' = (k >) . length . filter (<= 0) $ xs

-- type input\AngryProfessor.txt | stack runghc AngryProfessor.hs
-- https://www.hackerrank.com/challenges/angry-professor/problem