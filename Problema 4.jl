function e_pali(s::String)
    return(s == reverse(s))
end

function max_pali(a::Int64, b::Int64)
    num = [i*j for i in a:b for j in a:b];
    pali = [i for i in num if e_pali(string(i))]; 

    return maximum(pali)
end

max_pali(10, 99)
max_pali(100, 999)
max_pali(1000, 9999)