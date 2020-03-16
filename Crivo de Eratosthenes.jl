function crivo(n)
    primos = [true for i in 1:n] 
    p = 2
    while p*p <= n
        if primos[p] == true
            for i in p * p: p: n
                primos[i] = false
            end
        p += 1
        end
    end

    for p in 2:n
        if primos[p]
            print("$p\n")
        end
    end
end