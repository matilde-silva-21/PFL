myConcat :: Ord a => [[a]] -> [a]
myConcat listas = [valor | lista<-listas, valor<-lista]

myReplicate :: Int -> a -> [a]
myReplicate k st = [st| n<-[1..k]]


-- myIndex :: [a] -> Int -> a
-- myIndex xs k = [ xs[i] |  i<-[0..k], i==k] 
