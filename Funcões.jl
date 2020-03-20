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

function g3(x,y)
    return x + y, x^(2*y)
end
g3(2, 2)
typeof(g3(2,2))
 
# Forma abreviada
h(x, y) = x + y
h(1, 2)

# Aplicando um função num vetor/array, usar uma função e colocar . antes de passar os paretros
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

# Funções com multiplos parametros. Igual ao *args em python
function f(x, y, a...)
    return x, y, a
end

f(1, 2, [1, 2, 3])
f(1, 2, [1, 2, 3])[1]
f(1, 2, [1, 2, 3])[2]
f(1, 2, [1, 2, 3])[3]
f(1, 2)

# Podemos passar qualquer iteravel no varargs
t1 = [1, 2, 3, 4]
t2 = (1, 2, 3, 4)
f(1, 2, t1...)
f(1, 2, t2...)

# É possível desempacotar os args, mas tem q ficar atento ao numero de variaveis dentro da funcao
baz(a,b) = a + b
args = [1, 2]
baz(args...)

""" Da erro
args = [1, 2, pi]
baz(args...)
"""

# Passando um bloco para argumentos da função
map( x-> begin
            if x < 0 && iseven(x)
                return 0
            elseif x == 0 
                return 1
            else
                return x
            end
        end,
        [1, -1, 3])

## Usando a palavra reservado do, a sintaxe do x cria uma função anonima com o argumento x e passa com primeiro argumento do map
map([1, -1, 0, -4, 5]) do x
    if x < 0 && iseven(x)
        return 0
    elseif x == 0 
        return 1
    else
        return x
    end
end

map([1, -1, 0, -4, 5]) do x
    if iseven(x)
        return "O numero: $x em modulo é par"
    else
        return "O numero: $x em modulo é impar"
    end
end

# Funções Especiais são função de uso comum na programação, em geral possuem como argumento uma função e um iteravel.

## Filter retorna uma copia da Coleção (iteravel geralmente) com os valores filtrado pela função lambda
## , no primeiro argumento passa um função lambda e um iteravel
lista = [1, 2, 3, 4, 5];
filter(x -> x == 2, lista)
filter(x-> isodd(x) && x%3 == 0, lista)

## Map retorna uma copia da Coleção (iteravel geralmente) com os valores alterados pela função lambda,
## no primeiro argumento passa um função lambda e um iteravel

## Enumerate retorna uma tupla com indice e o valor do iteravel
for (index, valor) in enumerate(lista)
    print("$index, $valor \n")
end

## Findall retorna uma Coleção com os indices da Coleção que recebem true quando avaliadas na função passada
x = [1, 2, 3, 4, 5]
findall(x->x == pi, x)
findall(x->iseven(x), x)

