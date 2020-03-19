function digitos(n::Int64)
    num = string(BigInt(2)^n)
    algaritmos = [parse(Int64, i) for i in num]
    return sum(algaritmos)
end

digitos(15)
digitos(1000)