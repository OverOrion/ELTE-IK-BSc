module HW5 where 
import Data.List

--list
--f1
compress :: String -> [(Int, Char)]
compress s = [(length e, head e) | e <- group s]

--f2
decompress :: [(Int, Char)] -> String
decompress x = concat [replicate n c | (n, c) <- x]


--recursion
--f3
fib 0 = 0
fib 1 = 1 
fib 2 = 1 
fib n = fib (n-1) + fib (n-2)

--f4
or' :: [Bool] -> Bool
or' [] = False
or' (x:xs) = x || or' xs

--f5
elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' x (e:es) = x == e || elem' x es

--f6
replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' 1 x = [x]
replicate' n x = x : replicate' (n-1) x

--f7
eqList :: Eq a => [a] -> [a] -> Bool
eqList [] [] = True
eqList [x] [y] = x == y
eqList (x:xs) (y:ys) = x == y && eqList xs ys
eqList _ _ = False

--f8
dropEvery3 :: [a] -> [a]
dropEvery3 [] = []
dropEvery3 x = take 2 x ++ dropEvery3 (drop 3 x)

--f9
mapLength :: [[a]] -> [Int]
mapLength [] = []
mapLength [[]] = [0]
mapLength [(x)] = [length x]
mapLength (x:xs) = length x : mapLength xs
