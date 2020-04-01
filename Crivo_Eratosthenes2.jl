function crivo(n::Int64)
    numbers::Set{Int} = Set(2:n)
    primes::Array{Int64,1} = []
    while !isempty(numbers) 
       p = minimum(numbers)
       push!(primes,p);
       setdiff!(numbers,Set(p:p:n))
    end
    return primes
 end

crivo(1_000_000)