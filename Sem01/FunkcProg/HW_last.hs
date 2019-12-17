module HWfinal where

--f0
data USTime = PM Int Int | AM Int Int deriving (Eq, Show)

--f1
getHour :: USTime -> Int
getHour (PM 12 _ ) = 12
getHour (PM h _) = (h + 12)
getHour (AM h _) = mod h 12

getMin :: USTime -> Int
getMin (AM _ m) = m
getMin (PM _ m) = m


--f2
time :: Int -> Int -> Maybe USTime
time hour minute
  | 0 <= hour && hour < 24 && 0 <= minute && minute < 60 = if (12 > hour) then Just $ (AM (((hour+11) `mod` 12)+1) minute) else Just $ (PM (((hour+11) `mod` 12)+1) minute)
  | otherwise = Nothing

{-
   time hour minute
     | 0 <= hour && hour < 24 && 0 <= minute && minute < 60 && hour < 12 = Just $ (PM (mod hour 12) minute)
     | 0 <= hour && hour < 24 && 0 <= minute && minute < 60 && hour >= 12 = Just $ (AM (mod hour 12) minute)
     | otherwise = Nothing
-}

--f3
safeMaximum :: Ord a => [a] -> Maybe a
safeMaximum [] = Nothing
safeMaximum l  = Just $ maximum l

--f4
divWithList :: Double -> [Double] -> Maybe Double
divWithList n [] = Just n
divWithList n l@(x:xs)
  | elem 0 l = Nothing
  | otherwise = Just $  (/) n (product l)

--f5
data Shape = Point | Circle Double | Rect Double Double

instance Eq Shape where
  Point == Point = True
  Rect a b ==  Rect c d = a*b == c*d
  Circle r1 == Circle r2 = r1 == r2
  Rect a b == Circle r1 = a*b == r1*r1*pi
  Circle r1 == Rect a b = r1*r1*pi == a*b
  Point == Circle r1 = 0 == r1
  Rect a b == Point = a*b == 0

instance Ord Shape where
  Point <= Point = True
  Point <= Rect c d = 0 <= c*d
  Point <= Circle r1 = 0 <= r1
  Circle r1 <= Rect a b = r1*r1*pi <= a*b
  Rect a b <= Circle r1 = a*b <= r1*r1*pi
  Rect a b <= Rect c d = a*b <= c*d
  Circle r1 <= Circle r2 = r1 <= r2

