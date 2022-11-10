dec2int :: [Int] -> Int
dec2int l = foldl (\tot cur -> tot*10 + cur) 0 l