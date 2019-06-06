fib = 1:1:zipWith (+) fib (tail fib)

fib' = zip fib [1..]

fib'' n = head $ dropWhile ((<n).length.show.fst) fib'