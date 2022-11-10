combine :: Ord a => (a -> a) -> (a -> Bool) -> [a] -> [a]
combine f p (xs) = map f (filter p xs)