{- myScanl :: (a -> a -> a) -> a -> [a] -> [a]
myScanl _ _ [] = []
myScanl f z xs n = (myScanl f z (init xs)) -}

data Figura = Circ Float -- raio
            | Rect Float Float -- largura, altura
            deriving (Eq, Show)

quadrado :: Float -> Figura
quadrado h = Rect h h

