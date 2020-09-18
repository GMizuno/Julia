# Constructors são funções que criam novos objetos usando Struct.
# Ao contrario de linguagens como Pyhton e Java, Julia não possui classes.

# Criando o Constructors
struct Foo
    bar 
    baz
end

foo = Foo(1, 2)
foo.bar
foo.baz
typeof(foo.bar)
typeof(foo.baz)

# Podemos dizer o tipo dos objetos
struct Foo2
    bar::Int64
    baz::Float64
end

foo = Foo2(1, 2.1)
foo.bar
foo.baz

## Os valores foo.bar e foo.baz são imutaveis.

# Tornando este objeto mutavel
mutable struct Point
    x::Float64
    y::Float64
    z::Float64
end

p = Point(1, 2, 3)

# Mudando
p.x = 10;
p

# Inner Constructors
struct family
    num_members::Int64
    members::Array{String, 1}
end

f1 = family(3, ["Mae", "Irmao", "eu"])

## Criando uma função para 
function validate(obj :: family)
    if obj.num_members != length(obj.members)
        print("ERROR! Not all members listed!! ")
    end
end
validate(f1)

f2 = family(4, ["Mae", "Irmao", "eu"])
validate(f2)

## Criando um inner Constructor que fara a mesma coisa que a funcao validate
## Este modo de "validar" um objeto é mais eficiente que o anterior pois ele para de criar objetos de maneiras desnecessarias 
struct family
    num_members::Int64
    members::Array{String, 1}
    family(num_members, members) = num_members != length(members) ? error("Erro no número de membros") : new(num_members, members)
end

f1 = family(3, ["Mae", "Irmao", "eu"]);
f2 = family(4, ["Mae", "Irmao", "eu"]);
validate(f1)
validate(f2)

# Criando um Constructor sem especificar os tipos
struct Points{T}
    x::T
    y::T
    z::T
end

p1 = Points{Int64}(1, 2, 3)
p2 = Points{Float64}(1.1, 2.1, 3.1)
p3 = Points{Array{String, 1}}(["Mae", "Irmao", "eu"], ["Mae", "Irmao", "tu"], ["Mae", "Irmao"])

mutable struct Points2
    x::Number
    y::Number
    z::Number
end

p1 = Points2(1, 2, 3.1)

# Criando uma função que soma a, b e c unidades nas coordenadas x, y e y, respectivamente.

function soma(p::Points2, a::Number, b::Number, c::Number) 
    p.x += a
    p.y += b
    p.z += c 
end

# Passando uma mutable struct numa funcao
soma(p1, 1, pi, 3)
p1

# O mesmo nao pode ser feito com um immutable struct

# Exemplos de struct com function
struct family2
    num_members::Int
    members::Array{String, 1}
    function family2(num_members::Int, members::Array{String, 1}) 
        if num_members != length(members)
            return new(num_members, members[1:end-1])
        else
            return new(num_members, members)
        end
    end
end 

family2(3, ["Mae", "Irmao", "eu"])
family2(4, ["Mae", "Irmao", "eu"])

struct family3
    num_members::Int
    members::Array{String, 1}
    function family3(num_members::Int, members::Array{String, 1}) 
        if num_members != length(members)
            return new(0)
        else
            return new(num_members, members)
        end
    end
end 

family3(3, ["Mae", "Irmao", "eu"])
family3(4, ["Mae", "Irmao", "eu"])

struct family4
    num_members::Int
    members::Array{String, 1}
    function family4(num_members::Int, members::Array{String, 1}) 
        if num_members != length(members)
            return new(0)
        else
            return new(num_members, members)
        end
    end
    function family4(num_members::Int) 
        if num_members < 2
            return new()
        else
            return new(num_members)
        end
    end
end 

family4(3, ["Mae", "Irmao", "eu"])
family4(4, ["Mae", "Irmao", "eu"])
family4(4)


struct family5
    num_members::Int
    members::Array{String, 1}
    function family5(num_members::Int, members::Array{String, 1}, tira::Bool) 
        if tira == true
            return new(num_members, members[2:end-1])
        else
            return new(num_members, members)
        end
    end
end
family5(3, ["Mae", "Irmao", "eu"], true)
family5(4, ["Mae", "Irmao", "eu", "gato", "agregado"], false)

# Exemplo usadno promote 
struct B{T<:Real}
    x::T
    y::T
    function B(X::T, Y::T) where {T<:Real}
        W = X + pi
        new{T}(exp(W), W)
    end
    B(X::Real, Y::Real) where {T<:Real} = B(promote(X, Y)[1], promote(X, Y)[2]);
end

B(1.5, 5)