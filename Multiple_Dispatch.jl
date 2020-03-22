# Mutiple Dispatch  funciona de forma "analoga" a Classes e Métodos em linguagens como Python e Java.
# Em Julia, podemos criar numa mesma função diversos metodos mudando os tipos das variaveis.
# Although it seems a simple concept, multiple dispatch on the types of values is perhaps the single most powerful and central feature of the Julia language

f(x, y) = print("x é $x e y é $y")
f(1, 2)
f(1, "arroz")
methods(f)

# Criando um novo metodo, onde os parametros são inteiros
f(x::Int, y::Int) = print("x é o inteiro: $x e y é o inteiro: $y")
f(1, 2)
methods(f)

# Criando um novo metodo, onde os parametros são strings
f(x::String, y::String) = print("x é a string: $x e y é a string: $y")
f("1.1, pi", "RJ")
methods(f)

# Criando um novo metodo, onde os parametros são pontos flutuantes
f(x::Number, y::Number) = print("O numero x é: $x e o número y é: $y")
f(1.1, 2)
methods(f)

## Descobrindo qual metodo foi usado
@which f(1, "arroz")
@which f(1, 2)
@which f("1.1, pi", "RJ")
@which f(1.1, 2)

# Outro exemplos
g(x::Number, y::Number) = x+y  # g seria a soma (+)
g(x::Array, y::Number) = x[1] + y # agora g possui uma caracteristica diferente da soma(+)
g(1, 2)
g([1, 2, 3], 2)
g([1 2 3; 1 2 3], 2)

# Metodos Ambiguos
h(x::Float64, y) = 2x + y
h(x, y::Float64) = x + 2y
h(2.0, 3.0) # DA ERRO
# Julia manda uma msg de erro aos inves de escolher um dos metodos "aleatoriamente"
h(x::Float64, y::Float64) = 2x + 2y
h(2.0, 3)
h(2, 3.0)
h(2.0, 3.0)

# Métodos Paramétricos
tipo(x::T, y::T) where {T} = true
tipo(x, y) = false
tipo(pi, 1)
tipo(2, 1)
tipo(pi, exp(2))
tipo("pi", "1")

# Outro exemplos
function soma(x::T, y::T) where {T<:Real}
    return x+y
end

soma(1.1, 1.2)
soma(1.1, 3) # DA ERRO!!!, pois 1.1 e 3 nao sao do mesmo tipo

function soma2(x::T1, y::T) where {T<:Real, T1<:Real}
    return x+y
end
soma2(1.1, 1.2)
soma2(1.1, 3)
soma2(1.1, pi)

# Uma forma mais simples do que passa Int em todos os parametros
function soma3(x::T, y::T) where {T<:Int}
    return x+y
end
soma3(1, 3)
soma3(1, 3.1) # DA ERRO

# Outro exemplo
struct coordenada{T}
    X::T
    Y::T
end

p1 = coordenada{Float64}(1.1, 1.2)
typeof(p1)
p2 = coordenada{Float64}(2.5, 3.6)
typeof(p1)

function distancia(x::coordenada{T}, y::coordenada{T}) where {T<:Number} # poderia deixar where {T}
    dist = (p1.X - p2.X)^2 + (p1.Y - p2.Y)^2
    return sqrt(dist)
end

distancia(p1, p2)

# Observação
z(x::Int, y::Int) = print("x é o inteiro: $x e y é o inteiro: $y")
z(x::Float64, y::Float64) = print("x é o PF: $x e y é o PF: $y")
z(x::Number, y::Number) = print("O numero x é: $x e o número y é: $y")

z(1.1, 1.2)
z(1, 2)
z(1, 2.1)

# Associando uma função a um tipo
struct Poli{T}
    coef::Vector{T}
end
poli = Poli([1, 10, 100]);
typeof(poli)

# Funciona como construtor interno
function (poli_x::Poli)(x)
    coefs = poli_x.coef; soma = 0
    for (indice, valor) in enumerate(coefs)
        soma += valor*x^(indice - 1)
    end
    return soma
end

poli = Poli([1, 10, 100]);
typeof(poli)
poli(3)

poli = Poli([1, 10, pi, 30]);
poli(0)
poli(1)

# Outra forma de fazer, MAIS INTUITIVA
struct Poli{T}
    coef::Vector{T}
end

function poli_x2(p::Poli{T1}, x::T2) where {T1<:Real, T2<:Real}
    coefs = p.coef; soma = 0; 
    for (indice, valor) in enumerate(coefs)
        soma += valor*x^(indice - 1)
    end
    return soma
end
p = Poli([1, 10, pi, 30]);
poli_x2(p,1)

p = Poli([1, 10, 100]);
poli_x2(p,1)
poli_x2(p,0)
poli_x2(p,3)