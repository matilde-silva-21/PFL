intersperse :: Eq a => a -> [a] -> [a]
intersperse y (x:xs) = if (xs/=[]) then (x : y : (intersperse y xs)) else (x : intersperse y xs)
intersperse y [] = []