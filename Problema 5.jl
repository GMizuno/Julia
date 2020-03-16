i, j= 0, 0
num = 10

# Se num1 for mutiplo de 10, 9, 8 e 7 ele sera mutiplo dos anteriores
while j<1
    if num%10==0 && num%9==0 && num%8==0 && num%7==0
        global j +=2
        global num1=num
    else
        global num+=10
    end
end

# Se num1 for mutiplo de 11, 13, 14, 16, 17, 19 e 20 ele sera mutiplo dos anteriores
while i<1
    if num1%11==0 && num1%13==0 && num1%14==0 && num1%16==0 && num1%17==0 && num1%19==0 && num1%20==0
        global i +=2
        print(num1)
    else
        global num1 +=num
    end
end

print(num1)