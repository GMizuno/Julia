function d(n::Int)
    divisor = [i for i in 1:(n-1) if n%i == 0]
    return sum(divisor)
end

d(220); d(d(220))

function Amicable(a::Int)
    b = d(a); 
    if d(a) == b && d(b) == a && a!=b
        return true
    else 
        return false
    end
end

Amicable(1)

function p21()
    numeros = []
    for i in 1:10000
        if Amicable(i)
            push!(numeros, i)
        end
    end
    return sum(numeros
end

p21()

