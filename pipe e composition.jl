# Operador pipe
## Funciona da mesma forma que no R

# Exemplo 1
1:10|>sum

# Exemplo 2 - vectorize + pipe
f(x) = exp(x) + pi^2
1:50 .|> f

# Exemplo 3 - usando macro, podemos escolher onde passar o argumento
using Pipe
g(x, y) = 3*x + 5*y
@pipe 1 |> g(_, 30)
@pipe 1 |> g(30, _)

# Compondo funçoes

# Exemplo 1
(sqrt ∘ +)(3, 6)

# Exemplo 2
h(x) = exp(x)
(log ∘ h)(10)

# Exemplo 3
g(x, y) = 3*x + 5*y
(log ∘ g)(10, 10)