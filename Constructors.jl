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

# Podemos dizer o tipo 
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
p.x
p.y
p.z

# Mudando
p.x = 10
p.x