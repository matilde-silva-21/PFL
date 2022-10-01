perfeitos :: Integer -> [Integer]
perfeitos a = [x | x<-[1..a] , (sum([y | y<-[1..(x-1)], ((mod x y) == 0)]) == x)]
