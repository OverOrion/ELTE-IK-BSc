module HW7 where

fib :: Int -> Int
fib 0 = 0
fib n = fib' 0 1 n where
  fib' a b n
    | n == 0    = a
    | otherwise = fib' b (a+b) (n-1)


{-goodParentheses :: String -> Bool
goodParentheses xs = goodParentheses' xs [] where
  goodParentheses' (x:xs) []
    | x `elem` ['}', ']', ')'] = False
    | x `elem` ['{', '(', '['] = goodParentheses' xs [x]
    | otherwise = goodParentheses' xs []
  goodParentheses' [] _ = True
  goodParentheses' (x:xs) l@(a:acc)
    | x `elem` ['{', '(', '['] = goodParentheses' xs (x:l)
    | x `elem` ['}', ']', ')'] = x ==  pair a && goodParentheses' xs acc
    | otherwise = goodParentheses' xs acc
  pair '(' = ')'
  pair '[' = ']'
  pair '{' = '}'
-}
goodParentheses :: String -> Bool
goodParentheses [] = True
goodParentheses (x:xs)
    | (length (goodParentheses' (x:xs)) `mod` 2) == 1 = False
    | otherwise = filthyChecker'' (goodParentheses' (x:xs)) [] where
        filthyChecker [] _ = True
        filthyChecker'' (x:xs) (acc)
          | x `elem` "{,[,(" = filthyChecker'' xs (x : acc)
          |otherwise =  x == pair (head acc)
pair '(' = ')'
pair '[' = ']'
pair '{' = '}'
goodParentheses' xs = [ e | e <- xs, e `elem` "{}[]()"]


splitAt' :: Int -> [a] -> ([a], [a])
splitAt' _ [] = ([],[])
splitAt' 0 list = ([], list)
splitAt' n list@(x:xs) = splitAtHelper n list  where
       splitAtHelper 1 (x:xs) = ([x], xs)
       splitAtHelper n list   = (take n list, drop n list)


group' :: Eq a => [a] -> [[a]]
group' [] = []
group' (x:xs) = groupHelper [x] x xs where
   groupHelper accList e [] = [accList]
   groupHelper accList e (y:ys)
    | y == e    = groupHelper (accList ++ [y]) e ys
    | otherwise = accList : groupHelper [y] y ys

