function fac_mod(n::Int)
    num = string(n)
    return sum([ factorial(parse(Int, i)) for i in num ])
end

# PROBLEMA ACHAR UM LIMITE SUPERIOR