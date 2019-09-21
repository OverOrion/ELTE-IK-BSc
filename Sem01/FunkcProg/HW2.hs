--1. Állítsd elő a pozitív páros számok (végtelen) listáját!

evenNums :: [Int]
evenNums = [x | x <- [1..], even x]
--vagy: evenNums = [x | x <- [2,4..]]


--2. Add meg egy pozitív egész szám összes pozitív osztóját növekvő sorrendben!

divs :: Integer -> [Integer]
divs y = [z|z <- [1..y], y `mod` z == 0]


--3. Döntsd el egy pozitív egész számról, hogy prím-e!

isPrime :: Int -> Bool
divisors_int :: Int -> [Int]
divisors_int y = [z|z <- [1..y], y `mod` z == 0]
isPrime p = length(divisors_int p ) == 2
{-vagy?: isPrime p = (divisors_int p)!!1 == p (0 és 1-re index too large-ot ad vissza, lehetne if/else-vel javítani, de az nem elegáns:| ) -}


--4. Állítsd elő az [1,-2,3,-4,5, stb] (végtelen) listát!

hadNoIdeaForAName :: [Integer]
hadNoIdeaForAName = [if (odd x ) then x else (-x) | x <- [1..]]

{- Nem tudom olvasod-e a kommenteket, de nagyon jók voltak a feladatok, főle az tetszett, hogy a 3-as a 2-esre épült és figyelni kellett az Int és Integer közötti különbségre. 10/10 would do it again :D -}

