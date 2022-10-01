mersennes :: [Int]
mersennes = [2^x-1 | x<-[1..30], (2^x-1)<30]