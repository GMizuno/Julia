mult_5_ou_3 =[]

for i in 1:999
    if i % 3 == 0 || i % 5 == 0
        push!(mult_5_ou_3, i)
    end
end

sum(mult_5_ou_3)