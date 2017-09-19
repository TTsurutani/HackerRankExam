import Data.Char
import Data.List
main :: IO()
main = do
    _ : list <- lines <$> getContents
    -- ["12","1012"]
    let x1 = map (read::String->Int) list
    let x2 = map (nub.sep) list
    print x1
    print x2

-- 数字文字列を受けて、条件に合致する数を返す
--　数字を数値に
--　数字をばらしながら数値に
--　ばらした数値のリストをnub
-- nubした数値でリストをカウント
--　nubした数値で元数字を割って対象か否かを判定、Trueなら積算

sep :: String -> [Int]
sep [] = []
sep (x:xs) = digitToInt x : sep xs


-- type input\FindDigits.txt | stack runghc FindDigits.hs
-- https://www.hackerrank.com/challenges/find-digits