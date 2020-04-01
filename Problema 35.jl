using Primes

function rotations(n::Int) # Dado um numero n ele retorna a rotação dele
    digitos = reverse(digits(n)) # Para ficar na ordem
    num1 = [] # Guarda numeros rotacionados
    n = length(digitos)
    for i = 1:n
        num = [digitos[end]]
        for i = 1:n-1
            push!(num, digitos[i])
        end
        push!(num1, sum([num[i] * 10^(n-i) for i in 1:n]))
        digitos = num
        num = []
    end
    return unique(num1)
end

# Funcao que exclui todos os numeros ate n q pelo menos um dos algaritmos são pares
function exclui_2(n::Int)
    return [i for i in 1:2:n if sum(digits(i).%2) == length(digits(i))] # Estou pegando os nums q a soma dos restos dos alg setm soma dif do numero de digitos
end

function circular_prime(n::Int)
    primos = primes(n)
    return [issubset(rotations(i), primos) for i in exclui_2(n)] 
end

@time sum(circular_prime(1_000_000))+1 # +1 pois nao estou contando o 2
