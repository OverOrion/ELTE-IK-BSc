--import Data.List

--f1
assocRL :: ((a,b), c) -> (a, (b, c))
assocRL ((a,b), c) = (a, (b, c))

--f2
nonTrivialDivisors :: Int -> [Int]
nonTrivialDivisors n = [ d | d <- [2..n-1], mod n d == 0]

--f3
mirrorLast :: [a] -> [a]
mirrorLast [] = []
mirrorLast (x:xs) = (x:xs) ++ (tail (reverse (xs))) ++ [x]

--f4
minMax :: Ord a => [a] -> (a,a)
minMax l = (,) (minimum l) (maximum l)

--f5
isPalindrome :: Eq a => [a] -> Bool
isPalindrome l = reverse l == l

--f6
countNonEmpties :: [[a]] -> Int
countNonEmpties l1 = length $ filter (\x -> not $ null x) l1

--f7 
combine :: [a] -> [(a,a)]
combine (x0:x1:xs) = map ((,) x0) (x1:xs) ++ map ((,) x1) xs ++ combine xs
combine [x] = []
combine [] = []

--f8
ap2Maybe :: (a -> b -> c) -> Maybe a -> Maybe b -> Maybe c
ap2Maybe _ _ Nothing = Nothing
ap2Maybe _  Nothing _ = Nothing
ap2Maybe f (Just a) (Just b) = Just $ f a b

--f9
someSatisfying :: Int -> (a -> Bool) -> [a] -> [a]
someSatisfying n p l = take n $ filter (\x -> p x) l

--f10
pipeline :: [a -> a] -> a -> a
pipeline [] v = v
pipeline funs v = pipeline (init funs) $ (last funs v)


--f11
lookupPred :: (k -> Bool) -> [(k,v)] -> Maybe v
lookupPred _ [] = Nothing
lookupPred p (x@(a,b):xs)
  | p a = Just b
  | otherwise = lookupPred p xs

--f12
allSatisfying :: (a -> Bool) -> [[a]] -> [a]
allSatisfying _ [] = []
allSatisfying p (x:xs)
  | all p x = x ++ allSatisfying p xs
  | otherwise = allSatisfying p xs 

--f13
data NonEmpty a = NE a [a] deriving (Eq, Show)

--f14
--mapNE :: (a -> b) -> NonEmpty a -> NonEmpty b
mapNE f (NE x xs) = NE (head $ map f (x:xs) ) (tail $ map f (x:xs))


--f15
filterNE :: (a -> Bool) -> NonEmpty a -> Maybe (NonEmpty a)
filterNE p (NE x xs)
  | null $ filter p (x:xs) = Nothing
  | otherwise = Just $ NE (head $ filter p ([x])) (filter p xs)

