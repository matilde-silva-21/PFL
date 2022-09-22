converte1 :: Int -> String
converte1 x {-para 20 a 99-}
    | ((div x 10) >= 2) && ((div x 10) < 3) = "vinte e "
    | ((div x 10) >= 3) && ((div x 10) < 4) = "trinta e "
    | ((div x 10) >= 4) && ((div x 10) < 5) = "quarenta e "
    | ((div x 10) >= 5) && ((div x 10) < 6) = "cinquenta e "
    | ((div x 10) >= 6) && ((div x 10) < 7) = "sessenta e "
    | ((div x 10) >= 7) && ((div x 10) < 8) = "setenta e "
    | ((div x 10) >= 8) && ((div x 10) < 9) = "oitenta e "
    | ((div x 10) >= 9) && ((div x 10) < 10) = "noventa e "
    | otherwise = ""

converte2 :: Int -> String
converte2 x {-para 100 a 999-}
    | ((div x 100) >= 1) && ((div x 100) < 2) = "cento e "
    | ((div x 100) >= 2) && ((div x 100) < 3) = "duzentos e "
    | ((div x 100) >= 3) && ((div x 100) < 4) = "trezentos e "
    | ((div x 100) >= 4) && ((div x 100) < 5) = "quatrocentos e "
    | ((div x 100) >= 5) && ((div x 100) < 6) = "quinhentos e "
    | ((div x 100) >= 6) && ((div x 100) < 7) = "seixentos e "
    | ((div x 100) >= 7) && ((div x 100) < 8) = "setecentos e "
    | ((div x 100) >= 8) && ((div x 100) < 9) = "oitocentos e "
    | ((div x 100) >= 9) && ((div x 100) < 10) = "novecentos e "
    | otherwise = ""

converte3 :: Int -> String
converte3 x {-para 1 a 9-}
    | ((mod x 10) == 1) = "um"
    | ((mod x 10) == 2) = "dois"
    | ((mod x 10) == 3) = "três"
    | ((mod x 10) == 4) = "quatro"
    | ((mod x 10) == 5) = "cinco"
    | ((mod x 10) == 6) = "seis"
    | ((mod x 10) == 7) = "sete"
    | ((mod x 10) == 8) = "oito"
    | ((mod x 10) == 9) = "nove"

    