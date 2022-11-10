binom :: Integer -> Integer -> Integer
binom n k = div (product [1..n]) ((product[1..k]) * product[1..(n-k)])