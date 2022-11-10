binom :: Integer -> Integer -> Integer
binom n k = div (product [1..n]) ((product[1..k]) * product[1..(n-k)])

pascal :: Integer -> [[Integer]]
pascal 0 = [[0]]
pascal n = [([(binom x y) | y<-[0..x]]) | x<-[0..n]]