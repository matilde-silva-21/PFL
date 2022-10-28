-- Ex 7 --

ex7 :: IO ()
ex7 = do 
    putStrLn "Write something, anything: "
    str<-getLine
    putStrLn (reverse(str))

-- Ex 8 --

buildResult :: String -> String -> Char -> String 
buildResult [] [] _ = []
buildResult (x:word) (y:result) char = if(char == x) then ([x] ++ (buildResult word result char)) else ([y] ++ (buildResult word result char))

adivinha :: String -> IO ()
adivinha palavra = (adivinhaHelper (palavra) (0) (replicate (length palavra) '-') False)

adivinhaHelper :: String -> Int -> String -> Bool -> IO()
adivinhaHelper word nTries result error = do 
    if(word == result) then (do putStrLn ""; putStrLn word; putStr"Adivinhou em " ; putStr (show (nTries)) ; putStrLn " tentativas" ;) else do 
        (putStrLn "")
        if(error) then (do putStrLn"" ; putStrLn "Não Ocorre") else (putStrLn "")
        putStrLn (result)
        putStr "? "
        guess <- getChar
        if(elem guess word) then (adivinhaHelper (word) (nTries+1) (buildResult word result guess) False) else (adivinhaHelper (word) (nTries+1) result True)




main = adivinha "sopa"
