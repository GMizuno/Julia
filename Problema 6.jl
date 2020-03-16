function sum2(n)
    soma = 0
    for i in 1:n
        soma = soma +i^2
    end  
    return soma  
end

sum2(10)

function sumquad(n)
    soma = 0
    for i in 1:n
        soma = soma + i
    end  
    return soma^2 
end

sumquad(100) - sum2(100)