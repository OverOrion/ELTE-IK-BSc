import Data.List (sort)
--import Data.Maybe (fromJust)

--f1
toBack :: [a] -> [a]
toBack [] = []
toBack (x:xs) = xs ++ [x]


--f2
assocRL :: (a, (b, c)) -> ((a, b), c)
assocRL (a, (b, c)) = ((a, b), c)


--f3
mirrorFirst :: [a] -> [a]
mirrorFirst [] = []
mirrorFirst (x:xs) = reverse (xs) ++ [x] ++ xs

--f4
heads :: [[a]] -> [a]
heads [] = []
heads [[]] = []
heads (x:xs) = if not $ null x  then (head x) : heads xs else heads xs

--f5
isSorted :: Ord a => [a] -> Bool
isSorted [] = True
isSorted l1 = (reverse $ sort l1) == l1

--f6
countEmpties :: [[a]] -> Int
countEmpties l1 = length $ filter (\x -> null x) l1

--f7
takeLast :: Int -> [a] -> [a]
takeLast n l1 = reverse $ take n $ reverse l1

--f8
apMaybe :: Maybe (a -> b) -> Maybe a -> Maybe b
apMaybe (Just f) (Just v) = Just $ f v
apMaybe _ _ = Nothing

--f9
reverseWords :: String -> String
reverseWords sentence = unwords $ map reverse $ words sentence


--f10
pipeline :: [a -> a] -> a -> a
pipeline [] v = v
pipeline funs v = pipeline (init funs) $ (last funs v)

--f11
lookupPair :: (k -> v -> Bool) -> [(k,v)] -> Maybe (k,v)
lookupPair _ [] = Nothing
lookupPair p (x@(a,b):xs)
  | p a b = Just x
  | otherwise = lookupPair p xs

--f12
--onlyNonEmptySatisfying :: (a -> Bool) -> [[a]] -> [[a]]
onlyNonEmptySatisfying p [] = []
--onlyNonEmptySatisfying p l = filter (\x -> not $ null x) $ map $ filter p l 
onlyNonEmptySatisfying p (x:xs)
  | not $ null $ filter p x  = filter p x : onlyNonEmptySatisfying p xs
  | otherwise = onlyNonEmptySatisfying p xs

--f13
data Result a = Error String | Ok a deriving (Eq, Show)

--f14
safeHead :: [a] -> Result a
safeHead l
  | null l = Error $ "empty list"
  | otherwise = Ok $  head l

--f15
safeIndex :: [a] -> Int -> Result a
safeIndex list i
  | null list =  Error $ "index out of bounds"
  | i < 0 =  Error $ "index out of bounds"
  | (i > 0 ) && ( null $ take i list) =  Error $ "index out of bounds"
  | otherwise = Ok $ list !! i
