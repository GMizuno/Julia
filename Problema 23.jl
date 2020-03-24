function divisores(n::Int)
    divisor = [i for i in 1:(n-1) if n%i == 0]
    return sum(divisor)
end

function abundant(n::Int)
    soma = divisores(n)
    if soma>n
        return true
    else
        return false
    end    
end

function num()
    numeros = []
    for i in 1:28123
        if abundant(i) == true
            push!(numeros, i)
        end
    end
    return filter(x-> x <= 28123,numeros)
end

numeros = num()

function soma_2_2(x::Array{Any,1})
    tamanho = length(x); soma = []
    for i in 1:tamanho
        a = x[i]
        for j in i:tamanho
            push!(soma, x[i]+x[j])
        end
    end
    return unique(filter(x-> x <= 28123,soma))
end

soma_abu = soma_2_2(numeros)
sum(1:28123) - sum(soma_abu)

