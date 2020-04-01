using DelimitedFiles
# Poderia usar o CSV, mas este modulo é mais pesado 

# Lendo CSV 
dados = readdlm("C:\\Users\\Gabriel\\Desktop\\Julia\\banco.csv", ';') # Passando o separador
dados[1,:] # Nao temos colocar o header = true

base = readdlm("C:\\Users\\Gabriel\\Desktop\\Julia\\banco.csv", ';', header = true) # Passando o separador
typeof(dados) # 
dados = base[1] # dados
cabeçalho = base[2]

# Escrevendo um csv
z = rand(92)
head = hcat(cabeçalho, "Random")
data =  hcat(base[1], z)

writedlm("C:\\Users\\Gabriel\\Desktop\\Julia\\banco2.csv", [head ; data], ";")

using CSV

base = CSV.read("C:\\Users\\Gabriel\\Desktop\\Julia\\banco.csv")
base[!, 1] # Uma forma de acessar um coluna
base[!, 1:3] # Forma de acessar 2 ou mais colunas

base.Renda # Acessando um coluna usando nome
base[!, [:Renda, :N_dep]] # Forma de acessar 2 ou mais colunas

# Escrevendo num csv
using DataFrames
z = rand(92)
base1 = DataFrame(Random = z)
base = hcat(base, base1)
CSV.write("C:\\Users\\Gabriel\\Desktop\\Julia\\banco3.csv", base)

