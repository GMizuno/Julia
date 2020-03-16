function fiba(n::Int64)
    a, b, c = 1, 2, 0
    if n>=3
        for i in 3:n
            c = a + b
            a = b
            b = c
        end 
        return c
    elseif n == 2
        return b
    elseif n == 1
        return a
    end    
end

function menorqueK(k)
    n = 1
    while fiba(n) < k
        n += 1
    end
    return n-1
end

n = menorqueK(4*10^6)

seq = []
for i in 1:n
    if fiba(i)%2 == 0
        push!(seq, fiba(i))
    end
end
seq
sum(seq)
