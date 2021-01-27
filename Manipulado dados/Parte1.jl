using DataFrames
using Statistics 
using Pipe: @pipe # Usando @pipe macro
using RDatasets # Pegar datasets do R

iris = dataset("datasets", "iris");
head(iris)

mtcars = dataset("datasets", "mtcars");
head(mtcars);

# Breve resumo sobre pipe
@pipe 2 |> sqrt

function soma(a, b)
    a + b
end

@pipe 2 |> soma(1, _)
@pipe 2 |> soma(_, 1)
@pipe 2 |> soma(_, _)
@pipe 4 |> sqrt(_)

# Selecionando colunas 
@pipe iris |> select(_, :Species, :SepalWidth)
@pipe iris |> select(_, Not(:Species))
@pipe iris |> select(_, Between(:PetalLength, :SepalWidth))

iris[: ,[:Species, :SepalWidth]]
iris[: ,Not(:Species)]
iris[:,  Between(:PetalLength, :SepalWidth)] # Note que gera um df "vazio"
iris[:,  Between(:SepalWidth, :PetalWidth)]

# Renomeando
rename(iris, :Species => :Especies, :SepalWidth => :Alguma_coisa)
head(iris)

## Dica se usar ! ele já salva as alterações
rename!(iris, :Species => :Especies, :SepalWidth => :Alguma_coisa)
head(iris)
iris = dataset("datasets", "iris");

# Criando nova coluna
mtcars[:nova_va] = mtcars[:HP] ./ mtcars[:WT];
head(mtcars)
select(mtcars, :HP, :HP => (x -> x .+ 1))
select(mtcars, :HP, :HP => (x -> x .+ 1) => :Novo_HP)
@pipe mtcars |> transform(_, :MPG => mean => :MPG_mean) |> select(_, :MPG_mean) # Usei o select so para aparecer
@pipe mtcars |> transform(_, :MPG => (x -> x .+ 1)=> :MPG_offset) |> select(_, :MPG, :MPG_offset) # Usei o select so para aparecer
combine(mtcars, ([:HP, :MPG] .=> minimum))
combine(mtcars, (:HP => x -> exp.(x)))
combine(mtcars, (:HP => x -> exp.(x)))

# Filtrando
## :MPG => MPG funciona da mesma forma que no rename, em seguida usamos uma arrow function
@pipe mtcars |> filter(:MPG => x -> x > 20, _)
mtcars[mtcars[:Cyl] .== 4, :]

# Operacoes na coluna
combine(mtcars, :MPG => mean)
combine(mtcars, :MPG => mean => :Media_MPG)

combine(mtcars, [:MPG, :HP] .=> mean) # .=> operador elementwise

# Tirando NA
dropmissing(mtcars)
combine(mtcars, :HP=> (x -> mean(skipmissing(x))) => :HP_media)

# Agrupando
combine(groupby(iris, :Species), :SepalWidth => mean)
combine(groupby(iris, :Species), :SepalWidth => mean, :SepalWidth => std)
combine(groupby(iris, :Species), :SepalWidth => mean, :SepalWidth => minimum)
combine(groupby(iris, :Species), :SepalWidth => mean, :PetalLength => mean)
combine(groupby(iris, :Species), [:SepalWidth, :PetalLength] .=> mean .=> [:SepalWidth_media, :PetalLength_media])
combine(groupby(iris, :Species), [:SepalWidth, :PetalLength] .=> [mean, std]) # Resultado no foi o desejado
combine(groupby(iris, :Species), [:SepalWidth, :PetalLength] .=> mean, 
        [:SepalWidth, :PetalLength] .=> std)  # Resultado no foi o desejado
combine(iris, names(iris, r"^Petal") .=> mean)
combine(iris, filter(startswith("Petal"), names(iris)) .=> mean)
combine(iris, names(iris, r"Width$") .=> mean)
combine(iris, filter(endswith("Width"), names(iris)) .=> mean)

@pipe iris |> groupby(_, :Species) |> combine(_, :Species => length)
@pipe iris |> groupby(_, :Species) |> combine(_, :Species => length ∘ unique) 

