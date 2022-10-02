dotprod :: [Float] -> [Float] -> Float 
dotprod (x:xs) (y:ys) = x*y + dotprod xs ys
dotprod [] [] = 0