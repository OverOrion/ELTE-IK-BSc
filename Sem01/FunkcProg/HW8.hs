module HW8 where

unzip' :: [(a,b)] -> ([a],[b])
unzip' xs = (map fst xs, map snd xs)


merge :: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
    | x >= y = y : merge (x:xs) ys
    | otherwise = x : merge xs (y:ys)
{-
Ez nem ment magasabb rendűekkel :'( 
-}
    

monogram :: String -> String
monogram name =  unwords $ map (\c -> c :['.']) $ map head $ words name
