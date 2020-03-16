const mu_0 = 4e-7*pi; # Criar uma constante no escopo global, não é possivel modifica

x = rand(1000);
function sum_global()
    s = 0.0
    for i in x
        s += i
    end
    return s
end;

@time sum_global()
@time sum_global()

x = rand(1000);

function sum_arg(x)
    s = 0.0
    for i in x
        s += i
    end
    return s
end;

@time sum_global()
@time sum_global()

time_sum(x) = @time sum_arg(x);
time_sum(x)

vec = [1.1, -2, -pi, sin(pi)]
abs.(vec)
map(abs, vec)