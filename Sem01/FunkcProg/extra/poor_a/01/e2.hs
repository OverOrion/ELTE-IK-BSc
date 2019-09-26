a=2
b="szoveg"
inc' x = x+1

even' :: Int -> Bool
even' y = (y`mod`2)==0

odd' :: Int -> Bool
odd' z=(z`mod`2)==1

odd'' :: Int -> Bool
odd'' u = not (even' u)

divides :: Int-> Int-> Bool
divides a b = (b `mod` a)==0

area a b =a*b

triangleSides :: Int  -> Int  -> Int  -> Bool
triangleSides a b c = (a+b)>c && (a+c)>b && (c+b)>a

pythagoreanTriple :: Int -> Int -> Int -> Bool
pythagoreanTriple a b c = (a^2+b^2==c^2)

isLeapYear :: Int -> Bool
isLeapYear x = ((x `mod` 100 == 0) && (x `mod` 400 == 0)) || (x `mod` 4 ==0 && x `mod` 100 /=0)

