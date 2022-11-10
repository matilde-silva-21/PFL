myLast :: [Int] -> Int
myLast x = head (drop n x)
    where n = (length x - 1)
