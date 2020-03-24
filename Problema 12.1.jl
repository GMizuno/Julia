function num_triag(n::Int) # n tem q ser maior do 2, forma rapida de achar numero triangular
    return Int(n*(n+1)/2)
end

using Primes
function divisores(n::Int)
    num_div = 1
    for fator in collect(factor(n))
        print
        num_div = num_div*(fator[2]+1)
    end
    return num_div
end

n1 = num_triag(7)
p1 = divisores(n1)

function p12(n::Int) # n representa o n-esimo numero triangular
    num  = divisores(num_triag(n))
    while num < 500
        n = n + 1
        num  = divisores(num_triag(n))
    end
    return num_triag(n)
end

@time p12(5000)

