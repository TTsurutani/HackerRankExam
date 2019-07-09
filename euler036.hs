import Data.Char
isKai :: String -> Bool
isKai xs = xs == reverse xs

dec2Hex :: Int -> String
dec2Hex n 
  | d == 0 = [intToDigit m]
  | otherwise = intToDigit m : dec2Hex d
  where
    (d,m) = n `divMod` 2

ans :: Integer
ans = sum . map read 
      . filter (isKai.dec2Hex.read) 
      . filter isKai . map show 
      $ [1,3..999999] 