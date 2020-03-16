# Forma 1

function pyt_set1()
    for a in 1:1000
        for b in 1:1000-a
            if a^2 + b^2 == (1000 - a -b)^2
               return a*b*(1000-a-b)
           end
        end
    end
end

@time begin
    pyt_set1()
end
# Forma 2

function pyt_set2()
    for a in 1:998
        for b in a+1:1000-a
            if a^2 + b^2 == (1000 - a -b)^2
               return a*b*(1000-a-b)
           end
        end
    end
end

@time begin
    pyt_set2()
end

