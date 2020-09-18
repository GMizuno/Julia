# Esse script contem codigos do cap 15 do livro Think Julia

# Criando uma struct para tempo, lembre que struct sao funcoes tbm
struct MyTime
    hour
    minute
    second
end

# The function creates a new MyTime object, initializes its fields, and returns a reference to the new object. This is called a pure function 

# Queremos + dois "tempos"

function addtime(t1, t2)
    second = t1.second + t2.second
    minute = t1.minute + t2.minute
    hour = t1.hour + t2.hour
    if second >= 60
        second -= 60
        minute += 1
    end
    if minute >= 60
        minute -= 60
        hour += 1
    end
    MyTime(hour, minute, second)
end

t1 = MyTime(1, 30, 20)
t2 = MyTime(2, 40, 55)
addtime(t1, t2)
addtime(t1, t1)

# A funcao addtime ficou grande, sera que eh posssivel melhorar? SIM

# Sometimes it is useful for a function to modify the objects it gets as parameters. 
# In that case, the changes are visible to the caller. Functions that work this way are called modifiers

function increment(time, seconds)
    time.second += seconds
    while time.second > 60
        time.second -= 60
        time.minute += 1
    end
    while time.minute > 60
        time.minute -= 60
        time.hour += 1
    end
end

mutable struct MyTime2
    hour
    minute
    second
end

t1 = MyTime2(1, 30, 20)
increment(t1, 100)
t1

