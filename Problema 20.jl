function alg_fact(n::Int64)
    alg = [i for i in string(factorial(big(n)))]
    digitos = [parse(Int64, i) for i in alg]
    return sum(digitos)
end

alg_fact(100)