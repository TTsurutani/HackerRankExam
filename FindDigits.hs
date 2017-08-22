main :: IO()
main = do
    _ : list <- lines <$> getContents
    -- ["12","1012"]
    print list

-- 数字文字列を受けて、条件に合致する数を返す
--　数字を数値に
--　数字をばらしながら数値に
--　ばらした数値のリストをnub
-- nubした数値でリストをカウント
--　nubした数値で元数字を割って対象か否かを判定、Trueなら積算

solve :: String -> Int
solve = undefined


-- type input\FindDigits.txt | stack runghc FindDigits.hs
-- https://www.hackerrank.com/challenges/find-digits