myMinimum :: Ord a => [a] -> a
myMinimum [x] = x
myMinimum (x:xs) = if (x > y) then y else x
    where y = (myMinimum xs)