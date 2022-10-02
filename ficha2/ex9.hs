divprop :: Integer -> [Integer]
divprop x = [ y | y<-[1..(x-1)], ((mod x y) == 0)]