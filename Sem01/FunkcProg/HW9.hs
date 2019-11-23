module HW9 where
import Data.List (sort, group)

allPairsCoprimes :: [Int] -> [Int] -> Bool
{-allPairsCoprimes _ [] = True
allPairsCoprimes [] _ = True
allPairsCoprimes (x:xs) (y:ys)
  | gcd x y == 1 = True && allPairsCoprimes xs ys
  | otherwise = False
weak :/
  -}
 {-allPairsCoprimes l1 l2 = all (== 1) $ zipWith gcd l1 l2 
 almost there-}
allPairsCoprimes = (all (== 1) .) . zipWith (gcd)

uniq :: Ord a => [a] -> [a]
--uniq text = map head $ group $ sort text
uniq = map head . group . sort

{-
1 b
2 a
3 c
4 c
5 b
-}
