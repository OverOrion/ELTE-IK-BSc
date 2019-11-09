zip' :: [a] -> [b] -> [(a,b)]
zip' (a:as) (b:bs) = (a, b) : zip' as bs
zip' _ _= []
