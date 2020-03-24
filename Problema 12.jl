function num_triag(n::Int) # n tem q ser maior do 2
    numeros = [1, 3]; i = 3
    while n > length(numeros)
        ti = numeros[i-1] + i
        push!(numeros, ti)
        i = i + 1
    end
    return numeros[end]
end

function prime_factor(n::Int)
    fatores = []
    while n % 2 == 0
        push!(fatores, 2)
        n = n/2
    end 

    for i in 3:2:n
        while n%i == 0
            push!(fatores, i) 
            n = n/i
        end
    end   
    return fatores
end

# Vamos usar o "teorema" da fatoraçao de primos para achar o numero de divisores
function divisores(x::Array{Any,1})
    pi = unique(x); α = []
    for i in pi
        push!(α,count(a->a == i, x))
    end
    return prod(map(a->a + 1, α))
end

n1 = num_triag(7)
p1 = prime_factor(n1)
d1 = divisores(p1)

function divores_ntriag(n::Int) # Retorna o numero de divores do n-esimo numero triangular
    return divisores(prime_factor(num_triag(n)))
end

divores_ntriag(7)

function p12(n::Int) # n representa o n-esimo numero triangular
    num  = divores_ntriag(n)
    while num < 500
        n = n + 1
        print("$n\n")
        num  = divores_ntriag(n)
    end
    return num_triag(n-1)
end

@time p12(5000)