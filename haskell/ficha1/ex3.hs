metades :: [Int] -> ([Int], [Int])
metades x = (take n x , drop n x)
    where { n =  div (length x) 2;}

