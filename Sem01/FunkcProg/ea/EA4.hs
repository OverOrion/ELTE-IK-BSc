module EA4 where

--0,1,2 értékek
mul3 :: Int -> Int -> Int
--ver2
mul3 0 _ = 0
mul3 1 n = n
mul3 2 1 = 2
mul3 2 0 = 0
mul3 2 2 = 1

{- ver 1 
mul3 0 0 = 0
mul3 0 1 = 0
mul3 0 2 = 0
mul3 1 1 = 1
mul3 1 0 = 0
mul3 2 0 = 0
mul3 1 2 = 2
mul3 2 1 = 2
mul3 2 2 = 1
-}
{-
0*0 -> 0
..
1*2 -> 2
...
2*2 -> 1
-}

myAbs :: Int -> Int
myAbs x
    | 0 == x = x
    | x >  0 = x
    | x < 0 = -x

--n! -> n* (n-1)!
{-0! -> 1
1! -> 1-}
fact :: Integer -> Integer
fact 0 = 1
fact 1 = 1
fact n = n * fact(n-1)
