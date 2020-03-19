function duplo_pali(n::Int64)
    bina = digits(n, base = 2)
    n = string(n)
    return bina == reverse(bina) && n == reverse(n) 
end

lista = [num for num in 1:10^6 if duplo_pali(num)]
sum(lista)