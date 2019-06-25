iti :: [String]
iti = ["","one","two","three","four","five","six","seven","eight","nine"]
juu' :: [String]
juu' = ["ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen", "nineteen"] 
juu :: [String]
juu  = ["","","twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety"]

-- 1000
-- 100で割って商がゼロではない == 商 !! iti ++ conv 余り
-- 10で割って商がゼロではない＆２以上 == 商 !! juu ++ conv 余り
-- 10で割って商が１ == 商 !! juu'
-- otherwise (10で割って商がゼロ) == 余り !! iti



conv :: Int -> String
conv 1000 = "onethousand"
conv n 
  | n `div` 100 /= 0 && n `mod` 100 == 0 = iti  !! (n `div` 100) ++ "hundred"
  | n `div` 100 /= 0 = iti  !! (n `div` 100) ++ "hundredand" ++ conv (n `mod` 100)
  | n `div`  10 == 1 = juu' !! (n `mod`  10)
  | n `div`  10 /= 0 = juu  !! (n `div`  10) ++ conv (n `mod` 10)
  | otherwise        = iti  !! (n `mod`  10) 


ans :: Int
ans = sum $ map (length.conv) [1..1000]