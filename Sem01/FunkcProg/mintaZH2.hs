import Data.Char
--f1 fact
fact :: Integer -> Integer
fact 0 = 0
fact 1 = 1
fact n = n * fact (n-1)

--f2 distance
distance :: (Float, Float) -> (Float, Float) -> Float
distance (x1, y1) (x2, y2) = sqrt ((x1-x2)^2+(y1-y2)^2)

--f3 isTriangle
--isTriangle :: ((Float,Float), (Float,Float), (Float,Float)) -> Bool
isTriangle ((x1, y1), (x2, y2), (x3, y3))
    | otherwise = a+b > c && a+c > b && b+c > a
  where a = distance (x2, y2) (x3, y3)
        b = distance (x1, y1) (x3, y3)
        c = distance (x1, y1) (x2, y2)
--f4 countSpaces :: String -> Int
countSpaces :: String -> Int
countSpaces str = sum [ 1 | c<-str, isSpace c]

--f5 replaceAll :: Char -> Char -> String -> String
replaceAll :: Char -> Char -> String -> String
replaceAll _ _ "" = ""
replaceAll cOld cNew (x:xs)
    | x == cOld = cNew : replaceAll cOld cNew xs
    | otherwise = x : replaceAll cOld cNew xs


--f6 slice
slice :: Int -> [Int] -> [Int]
slice _ [] = []
slice 0 [x] = [x]
slice n list = take 2 (drop n list)

--f7 setEquals
setEquals :: [Int] -> [Int] -> Bool
setEquals [] [] = True
setEquals [] _ = False
setEquals _ [] = False
setEquals (x:xs) ys
    | length ys == length (x:xs) = [ e | e<-(x:xs), e `elem` ys] == (x:xs)
    | otherwise = False