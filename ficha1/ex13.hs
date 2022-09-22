safetail :: [a] -> [a]
safetail x
    | ((length x)> 0) = tail x
    | ((length x)==0) = []
    