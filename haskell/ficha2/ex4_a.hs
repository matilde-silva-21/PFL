insert :: Ord a => a -> [a] -> [a]
insert y (x:xs) = if (y<x) then (y : x : xs) else (x : (insert y xs)) 