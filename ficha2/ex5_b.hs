delete :: Eq a => a -> [a] -> [a]
delete y (x:xs) = if(x==y) then (xs) else (x : (delete y xs))