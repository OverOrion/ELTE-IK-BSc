module HW4 where 
import Data.Char 

--1 
foo :: Num a => [(a, a, a)] -> a 
foo [] = error "Empty list"
foo [(_)] = error "Not enough data"
foo [(_, _)] = error "Not enough data"
foo [(a,_,c)] = (a+c)

--2a 
isValidNamePart :: String -> Bool 
isValidNamePart (x:xs) =  and (isUpper x, [isLower c | c <-xs])

--2b 
isValidName :: String -> Bool 


--3a 
canPass :: String -> Bool 

--3b 
examinees :: [(String, String)] ->  [String]



