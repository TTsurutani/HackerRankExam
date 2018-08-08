-- 様々なパターンに対応できるよう判定関数とセットで渡せるように
-- 完全一致が必要なケースもある
-- かつ、と、またはの複合条件に対応するには、どんな書式がベスト？

import Data.List (isInfixOf)
main :: IO ()
main = do 
  xs <- words <$> getContents
  anyChecks "1-03 SUBENTRY : "                 ["SUBENTRY"] xs
  anyChecks "2-01 DOO : "                      ["DOO"] xs
  anyChecks "2-02 use SWITCH possibillity :  " ["ENDIF","ENDDSTBL"] xs
  anyChecks "2-04,30 SUBTURN : "               ["SUBTURN"] xs
  anyChecks "2-07 FIRST : "                    ["ENDFIRST"]  xs
  anyChecks "2-08 MATCH : "                    ["ENDMATCH"]  xs
  anyChecks "2-10 EDIT : "                     ["EDIT"] xs
  anyChecks "2-12 BANK1 : "                    ["BANK1"]  xs
  anyChecks "2-13 ACCALND : "                  ["\\ACCALND"]  xs
  anyChecks "2-14 ACAPLWK : "                  ["\\ACAPLWK"]  xs
  anyChecks "2-15 ACDELET : "                  ["\\ACDELET"] xs
  andChecks "2-17 EKLGET&KOZA= : "             ["EKLGET","KOZA=" ] xs
  anyChecks "2-20 PUT : "                      ["PUT"]  xs
  anyChecks "2-22 DBIO : "                     ["DBIO"] xs
  anyChecks "2-27 WTO : "                      ["WTO"]  xs
  anyChecks "3-02 TRT : "                      ["\\ACSCHA","\\ACCTRTL","\\IGATR","\\IHCHAR","\\IGTRT"] xs 
  anyChecks "4-01 WORKPOOL : "                 ["WORKPOOL"]  xs  
  --anyChecks "4-05 boundary : "                 ["DC H","DC F","DS H","DS F"] xs
  anyChecks "B-2-01 GET : "                    ["GET"] xs
  anyChecks "B-2-05,6 OPEN&CLOSE : "           ["OPEN","CLOSE"] xs
  anyChecks "6-01 ORG : "                      ["ORG"] xs

anyChecks :: String -> [String] -> [String] -> IO()
anyChecks _ [] _ = putStr ""
anyChecks notion (c:cs) xs
  | c `isIncluded` xs = putStrLn notion
  | otherwise = anyChecks notion cs xs        

andChecks :: String -> [String] -> [String] -> IO()
andChecks notion [] _ = putStrLn notion
andChecks notion (c:cs) xs
  | c `isIncluded` xs = andChecks notion cs xs
  | otherwise = putStr ""

-- |
-- keywordに部分一致する要素が含まれるかを判定する関数
-- >>> isIncluded "key" ["akey","bb"]
-- True
-- >>> isIncluded "key" ["aaa","bbb"]
-- False 

isIncluded :: String -> [String] -> Bool
isIncluded _ [] = False
isIncluded key (xs:xss)
  | key `isInfixOf` xs = True
  | otherwise = isIncluded key xss