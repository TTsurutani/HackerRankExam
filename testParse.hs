main :: IO ()
main = do 
  xs <- words <$> getContents
  print $ length xs
  putStr "1-03 SUBENTRY : "
  print $ "SUBENTRY" `elem` xs
  putStr "2-01 DOO : "
  print $ "DOO" `elem` xs
  putStr "2-02 use SWITCH possibillity :  "
  print (("ENDIF" `elem` xs) || ("ENDDSTBL" `elem` xs))
  putStr "2-04 SUBTURN : "
  print $ "SUBTURN" `elem` xs
  putStr "2-07 FIRST : "
  print $ "ENDFIRST" `elem` xs
 -- print $ any $ map ("\AC" `isPrefixOf`) xs
  putStr "2-08 MATCH : "
  print $ "ENDMATCH" `elem` xs
  putStr "2-10 EDIT : "
  print $ "ACEDIT" `elem` xs
  putStr "2-12 BANK1 : "
  print $ "BANK1" `elem` xs
  putStr "2-13 ACCALEND : "
  print $ "ACCALEND" `elem` xs
  putStr "2-14 ACCAPLWK : "
  print $ "ACCAPLWK" `elem` xs
  putStr "2-15 ACCDELETE : "
  print $ "ACDELETE" `elem` xs
  putStr "2-17 EKLGET&KOZA= : "
  print $ "EKLGET" `elem` xs && "KOZA=" `elem` xs
  putStr "2-20 PUT : "
  print $ "PUT" `elem` xs
  putStr "2-22 DBIO : "
  print $ "DBIO" `elem` xs
  putStr "2-27 WTO : "
  print $ "WTO" `elem` xs
  putStr "2-30 SUBTURN : "
  print $ "SUBTURN" `elem` xs
  putStr "3-02 TRT : "
  print $ "ACSCHA" `elem` xs || "ACCTRTL" `elem` xs || "IGATR" `elem` xs || "IHCHAR" `elem` xs || "IGTRT" `elem` xs
  putStr "4-01 WORKPOOL : "
  print $ "WORKPOOL" `elem` xs
  putStr "4-05 boundary : "
  print $ "DC H" `elem` xs || "DC F" `elem` xs || "DS H" `elem` xs || "DS F" `elem` xs
  putStr "B-2-01 GET : "
  print $ "GET" `elem` xs
  putStr "B-2-05,6 OPEN&CLOSE : "
  print $ "OPEN" `elem` xs || "CLOSE" `elem` xs
  putStr "6-01 ORG : "
  print $ "ORG" `elem` xs