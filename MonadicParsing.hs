-- まず実装に必要な次の標準ライブラリをimportする
import Control.Applicative
import Data.Char
-- Parser型はクラスのインスタンスから作られる？
-- 一つ目は、ダミーのコンストラクタPを伴ってnewtypeを使って再定義される
newtype Parser a = P (String -> [(a,String)])
-- この型のパーサーは入力の文字列を、単にダミーコンストラクタを取り除いてできた関数に適用することができる。
parse :: Parser a -> String -> [( a , String)]
parse (P p) inp = p inp
-- 我々の最初のパース用プリミティブはitemと呼ばれ、入力文字列が空のとき失敗し、一方で成功したときは最初の文字を結果の値とする。
item :: Parser Char
item = P (\inp -> case inp of
                    [] -> []
                    (x:xs) -> [(x,xs)])
-- itemパーサーは基本的な構成要素である、他の全てのパーサーから、文字を消費する、入力から、最終的に構築されるであろう。
--　その振る舞いは下の２つの例で描かれている
-- > parse item ""
-- []
-- > parse item "abc"
-- [(a,"bc")] 

-- 13.4 パーサーの順序付け？
-- functor,applicative,monad型のインスタンスになるようなパーサー型を作る
-- do記法がパーサーを順につなげるのに役立つ
-- 宣言はstate変換子と同様である、parserが失敗するかもしれないことに対処しなければいけない点をのぞいて
-- 最初のstepはParserをfunctorにすることだ

instance Functor Parser where
-- fmap :: (a -> b) -> Parser a -> Parser b
fmap g p = P (\inp -> case parse p inp of 
                [] -> []
                [(v,out)] -> [(g v,out)])


