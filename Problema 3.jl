function prime_factor(n)
    while n % 2 == 0
        print("2 , ")
        n = n/2
    end 

    for i in 3:2:n
        while n%i == 0
            print("$i, ")   
            n = n/i
        end
    end     
end

prime_factor(600851475143)
