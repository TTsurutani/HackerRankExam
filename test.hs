{-# LANGUAGE OverloadedStrings #-}

import Data.List (sortOn,stripPrefix)
import Data.Map.Strict qualified as M
import Data.Maybe (fromJust, isNothing)

type Section = String

type Separator = Char

depth :: Separator -> Section -> Int
depth _ [] = 0
depth sep (x : xs)
  | x == sep = depth sep xs + 1
  | otherwise = depth sep xs

head' :: [Section] -> Section
head' [] = "Not Found"
head' xs = Prelude.head xs

section :: [Section] -> Section
section = head' . Data.List.sortOn (depth '.')

iDs :: [(String, String)]
iDs =
  [ ("JPS", "AB"),
    ("760", "AA"),
    ("JPM", "BI"),
    ("JPR", "BR"),
    ("JPK", "BK")
  ]

idConv :: String -> Maybe String
idConv id = M.lookup id (M.fromList iDs)

makeEmployeeNo :: String -> String
makeEmployeeNo cnum
  | isNothing (idConv id) = "Not Found"
  | otherwise = fromJust (idConv id) ++ Prelude.take 6 cnum
  where
    id = Prelude.drop 6 cnum


form1 :: String
form1 = "0648YLE15 ((ＩＪＤＳ．ＦＳ．金融第五．開発．業務推進部)) IJDS. FS. Financial Services No5. Application Development. Business Systems (Kiyoshi Hasegawa （長谷川 潔 - ハセガワ キヨシ）)"

replace :: Eq a => [a] -> [a] -> [a] -> [a]
replace [] to xs = go xs
    where go [] = to
          go (x:xs) = to ++ x : go xs
replace from to xs | Just xs <- Data.List.stripPrefix from xs = to ++ replace from to xs
replace from to (x:xs) = x : replace from to xs
replace from to [] = []