raizes :: Float -> Float -> Float -> (Float, Float)
raizes a b c = (((-b + sqrt(tri)) / 2*a) , ((-b - sqrt(tri)) / 2*a))
    where tri = b^2 - 4*a*c