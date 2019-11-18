import Data.Char (toUpper)
tripletToList :: (Int, Int, Int) -> [Int]
tripletToList (a, b, c) = [a, b, c]

squareMul :: Int -> Int -> Int
squareMul a b = (a*a)*(b*b)

middle :: [Char] -> [Char]
middle [] = []
middle (x0:x1:xs) = x1: (init xs)
middle (x:xs) = []

toUpperSecondAndThird :: String -> String
toUpperSecondAndThird "" = ""
toUpperSecondAndThird arg@(x0:x1:xs)
  | length arg == 2 = x0 : toUpper x1 : xs
  | otherwise  = x0:(toUpper x1):toUpper((head xs)):tail xs

insertAt :: Int -> Char -> [Char] -> [Char]
insertAt n c list
  | n == 0 = c:list
  | n > length list = list ++ [c]
  | otherwise = take n list ++ [c] ++ drop n list

geometricSequence :: Int -> Int -> [Int]
--geometricSequence e exp = e : geometricSequence e^exp exp
geometricSequence e n = iterate (n*) e
