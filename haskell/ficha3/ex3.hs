myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith _ [] [] = []
myZipWith f (x:xs) (y:ys) = [f x y] ++ (myZipWith f xs ys)