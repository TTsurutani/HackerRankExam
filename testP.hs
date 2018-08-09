-- かつ、と、またはの複合条件に対応するには、どんな書式がベスト？

import Data.List (isInfixOf)
import System.Directory (getDirectoryContents)

type Notion = String
type SourceName = String
type SourceCode = [String]
type Keyword = String
type Func = Keyword -> SourceCode -> Bool
type Condition = (Keyword,Func)

main :: IO ()
main = do 
  list <- getDirectoryContents "."
  let list' = init.init $ list
  print list'
  mapM_ (check . getSourceCode) list'
  --check source

getSourceCode :: SourceName -> IO SourceCode
getSourceCode name = (name :) <$> (words <$> readFile name)


check :: IO SourceCode -> IO()  
check source' = do  
  source <- source'
  print $ head source
  --let z = filter ((||) <$> ( == "IF") <*> (== "ENDIF")) source
  --print z
  anyChecks "1-03 SUBENTRY : "                 [("SUBENTRY",elem)] source
  anyChecks "2-01 DOO : "                      [("DOO",elem)] source
  anyChecks "2-02 use SWITCH possibillity :  " [("ENDIF",elem),("ENDDSTBL",elem)] source
  anyChecks "2-04,30 SUBTURN : "               [("SUBTURN",elem)] source
  anyChecks "2-07 FIRST : "                    [("ENDFIRST",elem)]  source
  anyChecks "2-08 MATCH : "                    [("ENDMATCH",elem)]  source
  anyChecks "2-10 EDIT : "                     [("EDIT",isIncluded)] source
  anyChecks "2-12 BANK1 : "                    [("BANK1",isIncluded)]  source
  anyChecks "2-13 ACCALND : "                  [("\\ACCALND",elem)]  source
  anyChecks "2-14 ACAPLWK : "                  [("\\ACAPLWK",elem)]  source
  anyChecks "2-15 ACDELET : "                  [("\\ACDELET",elem)] source
  andChecks "2-17 EKLGET&KOZA= : "             [("\\EKLGET",elem),("KOZA=",isIncluded)] source
  anyChecks "2-20 PUT : "                      [("PUT",elem)]  source
  anyChecks "2-22 DBIO : "                     [("DBIO",isIncluded)] source
  anyChecks "2-27 WTO : "                      [("WTO",isIncluded)]  source
  anyChecks "3-02 TRT : "                      [("\\ACSCHA",elem),
                                                ("\\ACCTRTL",elem),
                                                ("\\IGATR",elem),
                                                ("\\IHCHAR",elem),
                                                ("\\IGTRT",elem)] source 
  anyChecks "4-01 WORKPOOL : "                 [("WORKPOOL",elem)]  source  
  anyChecks "4-05 boundary : "                 [("H",elem),("F",elem)] source
  anyChecks "B-2-01 GET : "                    [("GET",elem)] source
  anyChecks "B-2-05,6 OPEN&CLOSE : "           [("OPEN",elem),("CLOSE",elem)] source
  anyChecks "6-01 ORG : "                      [("ORG",elem)] source

anyChecks :: Notion -> [Condition] -> SourceCode -> IO()
anyChecks _ [] _ = return ()
anyChecks notion ((key,func):cs) source
  | not $ func key source = putStrLn notion
  | otherwise = anyChecks notion cs source        

andChecks :: Notion -> [Condition] -> SourceCode -> IO()
andChecks notion [] _ = putStrLn notion
andChecks notion ((key,func):cs) source
  | not $ func key source = andChecks notion cs source
  | otherwise = return ()

-- |
-- keywordに部分一致する要素が含まれるかを判定する関数
-- >>> isIncluded "key" ["akey","bb"]
-- True
-- >>> isIncluded "key" ["aaa","bbb"]
-- False 

isIncluded :: Keyword -> SourceCode -> Bool
isIncluded _ [] = False
isIncluded key (xs:xss)
  | key `isInfixOf` xs = True
  | otherwise = isIncluded key xss