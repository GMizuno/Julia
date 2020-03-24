f = open("C:\\Users\\Gabriel\\Desktop\\Julia\\Problema_8.txt")
lines = readlines(f)
# Concatemando as Strings
function concat(x::Array{String,1})
    palavra = ""
    for (indice, valor) in enumerate(x)
        palavra = palavra*valor
    end
    return palavra  
end

numero = concat(lines)

function prod_13(x::String)
    return prod([parse(Int, i) for i in x])
end

function maior_prod(x)
    tamanho = length(x); resto = tamanho%4; prods = []
    for i in 1:tamanho-13+1
        push!(prods, prod_13(x[i:i+13-1]))
    end
    return maximum(prods)
end

maior_prod(numero)
