mindiv :: Int -> Int
mindiv x = [n | n<-[1..y], (mod x n) == 0] !! 0
    where y = round x^(div 1 2)

{-PORQUE E QUE OS TIPOS EM HASKELL SAO TAO ESTUPIDOS-}