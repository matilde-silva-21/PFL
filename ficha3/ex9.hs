myScanl :: (a -> a -> a) -> a -> [a] -> [a]
myScanl f z xs n = (foldl f z xs) ++ (myScanl f z (take (n+1) xs))