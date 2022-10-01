pitagoricos :: Integer -> [(Integer ,Integer ,Integer )]
pitagoricos a = [(x,y,z) | x<-[1..a], y<-[1..a], z<-[1..a],( x^2+y^2 == z^2)]