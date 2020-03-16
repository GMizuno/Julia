# Forma 1 - Tempo 45.661531

function e_primo(n::Int64)
    status = true
    if n == 2
        status = true
        return status
    elseif n%2 == 0
        status = false
        return status
    end
    for i in 3:2:n-1
        if n%i == 0
            status = false
            break
        else
            status = true
        end
    end
    return status
end

function primo_ate_n(n::Int64)
    primos = [2]
    for i in 3:2:n
        if e_primo(i)
            push!(primos, i)
        end
    end
    return primos
end

n = 10001 # Chute inicial
primo_ate_n(n)

@time begin
    while length(primo_ate_n(n)) <= 10001
        l = length(primo_ate_n(n))
        print("$n, $l \n")
        global n += 1000
    end
end

primo_ate_n(n)[10001]

# Forma 2 - Tempo 0.051272

function crivo(n)

    primos = [true for i in 1:n] 
    p = 2
    while p*p <= n
        if primos[p] == true
            for i in p * p: p: n
                primos[i] = false
            end
        end
        p += 1
    end

    lista = []
    for p in 2:n
        if primos[p]
            push!(lista, p)
        end
    end
    return lista
end

@time begin
crivo(2*10^6)[10001]
end