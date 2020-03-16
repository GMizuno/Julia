function collatz(n::Int64)
    seq = []
    while n>1
        if n%2 == 0
            n = n/2
        else
            n = 3*n+1
        end
        push!(seq, n)
    end
    return seq
end

tamanho = []
@time begin
    for i in 1:10^6
        push!(tamanho, length(collatz(i)))
    end
end

i = 837799
length(collatz(i))

findmax(tamanho)
factorial(100)