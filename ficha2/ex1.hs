{- (a) -}
myand :: [Bool] -> Bool
myand [] = True
myand (x:xs) = x && (myand xs)

{- (b) -}
myor :: [Bool] -> Bool
myor (x:xs) = x || (myor xs)
myor [] = True

{- (c) -}
myconcat :: [[a]] -> [a]
myconcat (x:xs) = x ++ myconcat xs
myconcat [] = []

{- (d) -}
myreplicate :: Int -> a -> [a]
myreplicate 0 y = []
myreplicate x y = y : (myreplicate (x-1) y)

{- (e) -}
(-!) :: [a] -> Int -> a
(x:xs) -! 0 = x
(x:xs) -! a = xs -! (a-1)

{- (f) -}
myelem :: Eq a => a -> [a] -> Bool
myelem y (x:xs)= (y==x) || (myelem y xs)
myelem y [] = False