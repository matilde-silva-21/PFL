mdc :: Integer -> Integer -> Integer
mdc x 0 = x
mdc a b = mdc b (mod a b)

{- só funciona se a condiçao base estiver declarada antes da chamada recursiva porque?-}