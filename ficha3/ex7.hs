--(a)--
(!++) :: [a] -> [a] -> [a]
(!++) a b = foldr (:) b a 

--(b)--
myConcat :: [[a]] -> [a]
myConcat (x:y:xs) = (foldr (:) y x) ++ (myConcat xs)
myConcat [] = []

--(c)--
myReverse1 :: [a] -> [a]
myReverse1 xs = foldr (\x y -> y ++ [x]) [] xs --perguntar

--(d)--
myReverse2 :: [a] -> [a]
myReverse2 xs = foldl (\x y -> [y] ++ x) [] xs

--(e)--
myElem :: Eq a => a -> [a] -> Bool
myElem x y = any (\a-> a==x) y