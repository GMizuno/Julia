f = open("C:\\Users\\Gabriel\\Desktop\\Julia\\Problema_13.txt")
lines = readlines(f); 

function digitos(x::Array{String,1})
    numero = sum([parse(BigInt, lines[i]) for i in 1:100])
    numero = string(numero)[1:10]
    return numero
end

digitos(lines)

1+ 2 + 4 + 5 + 10 + 11 + 20 + 22 + 44 + 55 + 110