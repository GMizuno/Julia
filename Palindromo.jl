function palindromo(palavra)
    n = length(palavra)
    for i in 1:div(n,2)
        if palavra[n-i+1] != palavra[i]
            return false
        end
    end  
    return true   
end

palindromo("ana")
palindromo("esse")
palindromo("raio")

