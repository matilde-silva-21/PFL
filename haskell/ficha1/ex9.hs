classifica :: Int -> String
classifica x
    | (x <= 9) = "reprovado"
    | (x>=10 && x<=12) = "suficiente"
    | (x>=13 && x<=15) = "bom"
    | (x>=16 && x<=18) = "muito bom"
    | (x>=19 && x<=20) = "muito bom com distinção"
    | otherwise = "null"