myMaximum, myMinimum :: Ord a => [a] -> a

myMaximum l = foldl1 (\x y -> if(x>y) then x else y) l 
myMinimum l = foldl1 (\x y -> if(x<y) then x else y) l

myFoldl1 :: Ord a => (a->a->a) -> [a] -> a
myFoldl1 funky l = foldl funky (head l) (tail l)


myFoldr1 :: Ord a => (a->a->a) -> [a] -> a
myFoldr1 funky l = foldr funky (head l) (tail l)
