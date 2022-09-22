max3, min3 :: Ord a => a -> a -> a -> a
max3 x y z
    | (x>=y && x>=z) = x
    | (y>=x && y>=z) = y
    | (z>=x && z>=y) = z
min3 x y z
    | (x<=y && x<=z) = x
    | (y<=x && y<=z) = y
    | (z<=x && z<=y) = z