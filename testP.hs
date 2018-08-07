main :: IO ()
main = do 
  xs <- words <$> getContents
  check1 "1-03 SUBENTRY : " "SUBENTRY" xs
  check1 "2-01 DOO : " "DOO" xs
  anyChecks "2-02 use SWITCH possibillity :  " [("ENDIF" `elem`) , ("ENDDSTBL" `elem`)] xs
  check1 "2-04 SUBTURN : " "SUBTURN" xs
  check1 "2-07 FIRST : " "ENDFIRST"  xs
 -- print $ any $ map ("\AC" `isPrefixOf`) xs
  check1 "2-08 MATCH : " "ENDMATCH"  xs
  check1 "2-10 EDIT : " "ACEDIT" xs
  check1 "2-12 BANK1 : " "BANK1"  xs
  check1 "2-13 ACCALEND : " "ACCALEND"  xs
  check1 "2-14 ACCAPLWK : " "ACCAPLWK"  xs
  check1 "2-15 ACCDELETE : " "ACDELETE" xs
  andChecks "2-17 EKLGET&KOZA= : " [("EKLGET" `elem`), ("KOZA=" `elem`)] xs
  check1 "2-20 PUT : " "PUT"  xs
  check1 "2-22 DBIO : "  "DBIO" xs
  check1 "2-27 WTO : " "WTO"  xs
  check1 "2-30 SUBTURN : " "SUBTURN"  xs
  --checks "3-02 TRT : " ((||) <$> ("ACSCHA" `elem`) <*> ("ACCTRTL" `elem`) <*> ("IGATR" `elem`) <*>  ("IHCHAR" `elem`) <*> ("IGTRT" `elem`)) xs 
  check1 "4-01 WORKPOOL : " "WORKPOOL"  xs  
  --checks "4-05 boundary : " ((||) <$> ("DC H" `elem`) <*> ("DC F" `elem`) <*> ("DS H" `elem`) <*> ("DS F" `elem`)) xs
  check1 "B-2-01 GET : " "GET" xs
  
  anyChecks "B-2-05,6 OPEN&CLOSE : " [("OPEN" `elem`) , ("CLOSE" `elem`)] xs
  check1 "6-01 ORG : " "ORG" xs


check1 :: String -> String -> [String] -> IO ()
check1 notion keyword xs = 
    if keyword `elem` xs 
        then putStrLn notion
        else putStr ""

anyChecks :: String -> [String -> Bool] -> [String] -> IO()
anyChecks notion cond xs =
    if any cond xs
        then putStrLn notion
        else putStr ""

andChecks :: String -> [String -> Bool] -> [String] -> IO()
andChecks notion cond xs =
    if and cond xs
        then putStrLn notion
        else putStr ""