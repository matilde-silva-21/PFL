forte :: String -> Bool 
forte x = (length(x) > 8) && (length ([ y | y <- x , (((fromEnum y) > 64) && ((fromEnum y) < 91))]) >= 1) && (length ([ y | y <- x , (((fromEnum y) > 96) && ((fromEnum y) < 123))]) >= 1) && (length ([ y | y <- x , (((fromEnum y) > 48) && ((fromEnum y) < 58))]) >= 1)