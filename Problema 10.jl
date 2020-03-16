# Forma 1 - Tempo 182.502054
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

function soma_primo_ate_n(n::Int64)
    soma = 2
    for i in 3:2:n-1
        if e_primo(i)
            soma = soma + i
        end
    end
    return soma
end

n = 2000000
@time begin
    soma_primo_ate_n(n)
end

# Forma 2 - Tempo 0.006749

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

    soma = 0
    for p in 2:n
        if primos[p]
            soma = soma + p
        end
    end
    return soma
end

@time begin
    n = 2000000
    crivo(n)
end
