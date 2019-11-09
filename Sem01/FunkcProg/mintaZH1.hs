module MintaZH1 where
import Data.Char
--f1 Vedd ki egy listából az első és utolsó elemét! 1p
{-
startEnd :: [Int] -> [Int]

startEnd []          == []
startEnd [10]        == [10]
startEnd [1,10]      == [1,10]
startEnd [100,99..5] == [100,5]
-}
startEnd :: [Int] -> [Int]
startEnd [] = []
startEnd [x] = [x]
startEnd (x:xs) = x : [(last xs)]

--f2 Keverd össze egy rendezett hármas elemeit! 1p
{-
jumble :: (a, b, c) -> (b, a, c)

jumble (1, True, '?')            == (True, 1, '?')
jumble ("Haskell", '!', [5,6,7]) == ('!', "Haskell", [5,6,7])
-}
jumble :: (a, b, c) -> (b, a, c)
jumble (a, b, c) = (b, a, c)

--f3 Írj egy longerThan függvényt, mely megállapítja, hogy egy lista hosszabb-e egy adott számnál! 1p
{-
longerThan :: [a] -> Int -> Bool

longerThan [1..10] 5
longerThan [1..100] 99
longerThan [1..] 50
not (longerThan [] 0)
not (longerThan [1..10] 20)
-}
--longerThan :: [a] -> Int -> Bool
longerThan list n = not (null (drop n list))


--f4 Definiáld a signum függvényt! Ez pozitív számnál 1-et, 0-nál 0-át, negatív számnál -1-et ad eredményül. A singum függvény nem használható. 1p

{-
signum' :: Int -> Int

signum' 1    == 1
signum' 45   == 1
signum' 0    == 0
signum' (-1) == -1
signum' (-9) == -1
-}
signum' :: Int -> Int
signum' n
    | n < 0 = -1
    | n == 0 = 0
    | otherwise = 1

--f5 Ellenőrizd le, hogy egy szövegben minden mondatvégi írásjel ('.', '!' és '?') után szerepel-e szóköz! 2p
{-
marksCorrect :: String -> Bool

marksCorrect ""
marksCorrect "x"
marksCorrect "Hello! You look great today"
marksCorrect "Howdy? I'm fine. Thanks"
not (marksCorrect "This looks bad.Dunno why")
not (marksCorrect "!")
marksCorrect "I'm sure this goes smoothly"
-}
--marksCorrect :: String -> Bool

marksCorrect "" = True
marksCorrect [x]
    | x == '?' || x == '.' || x == '!' = False
    | otherwise = True
marksCorrect str@(x0:x1:xs)
    | x0 == '!' && not (isSpace x1) = False && marksCorrect (x1:xs)
    | x0 == '.' && not (isSpace x1) = False && marksCorrect (x1:xs)
    | x0 == '?' && not (isSpace x1) = False && marksCorrect (x1:xs)
    | otherwise = False || marksCorrect (x1:xs)
--f6 Adott a BE-AD-ban, hogy a házi feladatra ki hányszor töltött fel megoldást (név, Neptun-kód, feltöltések) alakban: 2p
stats :: [(String, String, Int)]
stats = [ ("Kis Anna", "GKR2Z0", 2)
        , ("Zalai Endre", "GKR2Z0", 1)
        , ("Mezei Tamara", "TP0K4M", 0)
        , ("Beke Roland", "P5KN81", 3)
        ]

stats2 :: [(String, String, Int)]
stats2 = [ ("Kis Anna", "GKR2Z0", 0)
         , ("Zalai Endre", "GKR2Z0", 2)
         , ("Mezei Tamara", "TP0K4M", 1)
         , ("Beke Roland", "P5KN81", 1)
         ]
{-Listázd ki azokat a diákokat, akik pontosan egyszer töltöttek föl megoldást!

oneShot :: [(String, String, Int)] -> [(String, String)]

oneShot stats  == [("Zalai Endre", "GKR2Z0")]
oneShot stats2 == [("Mezei Tamara", "TP0K4M"), ("Beke Roland", "P5KN81")]
-}
trd (a, b, c) = c
ntrd (a, b, c) = (a, b)

oneShot :: [(String, String, Int)] -> [(String, String)]
oneShot [] = []
oneShot ((a,b,c):xs) = oneShooter ((a,b,c):xs) where
oneShooter ((a,b,c):xs)
        | c == 1 = (a, b) : oneShot xs
        | otherwise = oneShot xs

{- f7  Valósítsd meg a bitenkénti ,,és'' műveletet két kettes számrendszerbeli számon! A két listában azonos pozíción 1-nek kell szerepelnie, hogy a kimenetben is 1-es legyen. 2p
Elég a rövidebb lista végéig folytatni a bitműveletet. 
bitWiseAnd :: [Int] -> [Int] -> [Int]

bitWiseAnd []  [0] == []
bitWiseAnd [0] [0] == [0]
bitWiseAnd [1] [1] == [1]
bitWiseAnd [0] [1] == [0]
bitWiseAnd [0,1,0] [1,0,1]     == [0,0,0]
bitWiseAnd [1,1,0,1] [1,0,1,1] == [1,0,0,1]
-}
bitWiseAnd :: [Int] -> [Int] -> [Int]
bitWiseAnd [] _ = []
bitWiseAnd _ [] = []
bitWiseAnd (x:xs) (y:ys)
    | x == 1 && y == x = 1 : bitWiseAnd xs ys 
    | otherwise = 0 : bitWiseAnd xs ys
