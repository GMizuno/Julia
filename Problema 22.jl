letras = ["A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"]; tamanho = length(letras)
dict = Dict(letras[i] => i for i = 1:tamanho)

using DelimitedFiles
nomes = readdlm("C:\\Users\\Gabriel\\Desktop\\Julia\\Problema_22.txt",',',String) 
nomes_ord = sort(nomes, dims = 2)

function pont_parcial(x::String, dicionario = dict)
    pontos = 0
    for k in x
        pontos = pontos + dict["$k"][1]
    end
    return pontos
end

function pontos_totais(x::Array{String,2})
    pontos = 0
    for (indice, palavra) in enumerate(x)
        pontos = pontos + indice*pont_parcial(palavra)
    end
    return pontos
end

pontos_totais(nomes_ord)
