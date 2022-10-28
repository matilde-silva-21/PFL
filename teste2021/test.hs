-- ex1

maxpos :: [Int] -> Int
maxpos xs = maxposHelper xs 0

maxposHelper :: [Int] -> Int -> Int
maxposHelper [] n = n
maxposHelper (x:xs) n = if(x>n) then  (maxposHelper xs x) else (maxposHelper xs n)

-- ex2

dups :: [a] -> [a]
dups xs = dupsHelper xs 0


dupsHelper :: [a] -> Int -> [a]
dupsHelper [] _ = []
dupsHelper (x:xs) index =  if((mod index 2) == 0) then ([x] ++ [x] ++ (dupsHelper (xs) (index+1))) else ([x] ++ (dupsHelper (xs) (index+1)))

-- ex3
transforma :: String -> String
transforma xs = transformaHelper xs "aeiou"

transformaHelper :: String -> String -> String
transformaHelper [] _ = []
transformaHelper (letter:word) vowels = if(elem letter vowels) then ([letter] ++ "p" ++ [letter] ++ next) else ([letter] ++ next)
    where next = (transformaHelper word vowels)

-- ex4
transposta :: [[Int]] -> [[Int]]
transposta xs = transpostaHelper xs 0

transpostaHelper :: [[Int]] -> Int -> [[Int]]
transpostaHelper list index = next
    where next = if ((length (list !! 0)) == index) then [] else ([[(y!!index) | y<-list]] ++ transpostaHelper list (index+1))

-- ex5
prodInterno :: [Int] -> [Int] -> Int
prodInterno      (y:vec2) = 



