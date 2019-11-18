module MintaZH_BEAD where
import Data.Char (isUpper)

f :: [(Int, Int)] -> Int
f ((a1,a2):(b1,b2):xs) = a1 + a2 + b1 + b2


timeAdd :: (Int, Int) -> (Int, Int) -> (Int, Int)
timeAdd (a, b) (c, d) = ((a+c + (b+d) `div` 60) `mod` 24, (b+d) `mod` 60)

isSmile :: String -> Bool
isSmile smiley@(x0:x1:s)
  | length smiley == 2 && x0 == ':' || x0 == ';' = x1 `elem` "}])"
  | otherwise = False
isSmile _ = False

{-isSmile (x0:x1:s) = x0 `elem` ":;" && x1 `elem` "}])" && null s-}

bimBam :: Int -> String

bimBam x
  | x `mod` 15 == 0 = "BimBam"
  | x `mod` 5 ==  0 =  "Bam"
  | x `mod` 3 ==  0 = "Bim"
  | otherwise = ""

minList :: [Int] -> [Int] -> [Int]
minList _ [] = []
minList [] _ = []
minList (x:xs) (y:ys)
  | x <= y = x : minList xs ys
  | y < x = y : minList xs ys


wordNumWithCapital :: String -> Int
{-wordNumWithCapital  (x:xs) = sum [ 1 |  c <- (x:xs), isUpper c]-}

wordNumWithCapital list = length $ filter helper $ words list where
  helper (x:xs) = isUpper x

oneMatrix :: Int ->  [[Int]]
--oneMatrix 0 = []
oneMatrix n = replicate n $ replicate n 1
