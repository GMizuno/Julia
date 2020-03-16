# Forma 1- Pior forma

# temos que resolver 200x + 100y + 50z +... + w = 200
# onde as varaaveis possuem resotricoes
# é mais facil fazer x = 0 

total = 1

for i in 0:2
    for j in 0:4
        for w in 0:10
            for x in 0:20
                for y in 0:40
                    for z in 0:100
                        for a in 0:200
                            if 100*i+50*j+20*w+10*x+5*y+2*z+a == 200
                                global total += 1
                                print("$i, $j, $w, $x, $y, $z, $a \n")
                            end
                        end
                    end
                end
            end
        end
    end
end

# Forma 2
