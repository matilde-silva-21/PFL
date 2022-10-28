data Arv a = Vazia | No a (Arv a) (Arv a)
            deriving (Eq, Show)

inserir :: Ord a => a -> Arv a -> Arv a
inserir x Vazia = No x Vazia Vazia
inserir x (No y esq dir)
    | x==y = No y esq dir -- já ocorre; não insere
    | x<y = No y (inserir x esq) dir -- insere à esquerda
    | x>y = No y esq (inserir x dir) -- insere à direita


construir :: Ord a => [a] -> Arv a
construir [] = Vazia
construir (x:xs) = inserir x (construir xs)


listar :: Arv a -> [a]
listar Vazia = []
listar (No x esq dir) = listar esq ++ [x] ++ listar dir


--Ex 1--
sumArv :: Num a => Arv a -> a
sumArv (No x esq dir)= sumArv (esq) + sumArv(dir) + x
sumArv Vazia = 0

--Ex 2--
quicksort :: Ord a => [a] -> [a]
quicksort []     = []
quicksort (p:xs) = (quicksort lesser) ++ [p] ++ (quicksort greater)
    where
        lesser  = filter (< p) xs
        greater = filter (>= p) xs

ordemDecrescente :: Ord a => Arv a -> [a]
ordemDecrescente xs = reverse (quicksort (listar xs))

--Ex 3--
nivel :: Int -> Arv a -> [a]
nivel _ Vazia = []
nivel n (No x esq dir) = if(n==0) then (nivel (n-1) esq ++ [x] ++ nivel (n-1) dir) else (nivel (n-1) esq ++ nivel (n-1) dir)

--Ex 4--

--(a)--

criarContar :: Arv a -> Int
criarContar Vazia = 0
criarContar (No x esq dir) = max (1 + criarContar(esq)) (1 + criarContar(dir))

altura :: Ord a => [a] -> Int
altura xs = criarContar (construir xs)

--(b)--

altura2 :: Ord a => [a] -> Int
altura2 xs = criarContar (foldr inserir Vazia xs)

--Ex 5--
mapArv :: Ord b => (a -> b) -> Arv a -> Arv b
mapArv f Vazia = Vazia
mapArv f (No x esq dir) = (No (f x) (mapArv f esq) (mapArv f dir))


--Ex 6--

--(a)--
mais_dir :: Arv a -> a
mais_dir(No x Vazia _) = x
mais_dir (No _ _ dir) = mais_dir dir

--(b)--



