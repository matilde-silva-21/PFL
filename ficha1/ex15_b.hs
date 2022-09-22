mediana :: Int -> Int -> Int -> Int
mediana x y z = ((x+y+z) - (max (max x y) z) - (min (min x y) z))
