module HW4 where 
import Data.Char 

--1 
foo :: Num a => [(a, a, a)] -> a 
foo [] = error "Empty list"
foo [a]= error "Not enough parameters"
foo (_:(a, b, c):_) = a+c

--2a 
isValidNamePart :: String -> Bool
--isValidNamePart (n:ame) = isUpper n && all isLower ame
isValidNamePart (n:ame) = isUpper n && and [ isLower co| co <- ame]

--2b 
isValidName :: String -> Bool
--isValidName fullName = all isValidNamePart [ part| part <- words (fullName)]
isValidName fullName = and [isValidNamePart namepart | namepart<- words fullName]
    where isValidNamePart (n:ame) = isUpper n && and [ isLower co| co <- ame]

--3a 
canPass :: String -> Bool
canPass grades = sum([digitToInt i | i <- grades])>=12

--3b 
examinees :: [(String, String)] -> [String]
examinees x = [name | (name, result) <- x, canPass result]
    where canPass grades = sum([digitToInt i | i <- grades])>=12
