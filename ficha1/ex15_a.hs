mediana :: Num a => a -> a -> a -> a
mediana x y z 
    | ((x>=y && x<=z) || (x>=z && x<=y)) = x
    | ((y>=z && y<=x) || (y>=x && y<=z)) = y 
    | ((z>=y && z<=x) || (z>=x && z<=y)) = z
    