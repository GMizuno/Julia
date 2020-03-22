# Comaprando velocidade em um de um codigo
n = 5*10^8;

# Forma 1
soma = 0
@time begin
    for i in 1:n
        global soma = soma + exp(i)
    end
end

# Forma 2
function soma_exp(soma)
    for i in 1:5000000
        soma = soma +exp(i);
    end
    return soma
end

@time soma_exp(0)
# Forma 3
function soma_exp2(soma::Int) 
    for i in 1:5000000
        soma = soma + exp(i);
    end
    return soma
end
@time soma_exp2(0)

# Forma 4
@time sum(map(x->exp(x), 1:n))

# Forma 5
@time sum(exp.(1:n))

# Colocação
## 1-) Forma 2 e 3
## 2-) Forma 4
## 3-) Forma 5
## 4-) Forma 1


