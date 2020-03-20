# Retorno de uma função, na Julia o retorno de uma função sera a ultima linha da função ou o q estiver dentro do return
function f(x,y)
    x + y
end
f(1, 2)

function g(x,y)
    return x + y
end
g(1, 2)

function g1(x,y)
    return x + y
    x^(2*y)
end
g1(2, 2)

# Para ter multiplos retronos 
function g2(x,y)
    x + y, x^(2*y)
end
g2(2, 2)
typeof(g2(2,2))
 
# Forma abreviada
h(x, y) = x + y
h(1, 2)

# Aplicando um função num vetor/array
t(x) = x^2
x = [1, 2, 3, 4];
t.(x)
y = [1 2 3 4;
    10 20 30 40];
t.(y)

# Funções Lambdas ou Anonimas, importante para usar conjuntamente com Map, List Comprehsion
## Com um parametro
x -> 2 + x^2
## ou
a = x -> 2 + x^2
a(1)

map(x -> 2 + x^2, [1, 2, 3])
[a(i) for i in rand(10)]

## Com mais de um parametro
(x,y,z)->2x+y-z
b = (x,y,z)->2x+y-z
b(10, 2, 3)
