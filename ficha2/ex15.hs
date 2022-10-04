stringToAsciiArr :: String -> [Int]
stringToAsciiArr (x:xs) = [fromEnum(x)] ++ stringToAsciiArr(xs)
stringToAsciiArr [] = []

asciiArrToString :: [Int] -> String
asciiArrToString (x:xs) = (toEnum(x) :: Char) : asciiArrToString(xs)
asciiArrToString [] = ""


sumChar :: Int -> Int -> Int --primeiro recebo o char em ascii depois o k
sumChar a k 
    | (((a+k)<97 && (a+k)>90) || ((a+k)<64) && (a>64 && a<91)) = (a+k+26)
    | (a>96 && a<123) = if ((a+k) > 122) then ((a-122)+k+96) else (a+k)
    | (a>64 && a<91) = if ((a+k) > 90) then ((a-90)+k+65) else (a+k)
    | otherwise = a

sumCharArr :: [Int] -> Int -> [Int]
sumCharArr (x:xs) k = (sumChar x k) : (sumCharArr xs k)
sumCharArr [] k = []

cifrar :: Int -> String -> String
cifrar n str = asciiArrToString (sumCharArr (stringToAsciiArr str) n)
