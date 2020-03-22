# Constructors são funções que criam novos objetos.
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

struct Points2{T1, T2}
    x::T1
    y::T1
    z::T2
end

p1 = Points2{Int64, Float64}(1, 2, 3.1)
