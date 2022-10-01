primo :: Integer -> Bool
primo x = (([ y | y<-[2..(x-1)], ((mod x y) == 0)]) == []) && x/=1