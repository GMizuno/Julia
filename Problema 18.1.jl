# Indo de baixo para cima
using LinearAlgebra
function soma_tring(L, num1)
    linhas, colunas = size(L,1), size(L,2);
    soma = 0; soma = zeros(linhas, colunas);
    for i in linhas:-1:2
        for j in 1:i-1
            L[i-1, j] = L[i-1,j] + max(L[i,j], L[i,j+1]); 
        end  
    end
    return L[1,1]
end


L = [3 0 0 0;
    7 4 0 0 ;
    2 4 6 0 ;
    8 5 9 3]

soma_tring(L, 3)

L = [75 zeros(1,14); 
    95 64 zeros(1,13);
    17 47 82 zeros(1,12);
    18 35 87 10 zeros(1,11);
    20 04 82 47 65 zeros(1,10);
    19 01 23 75 03 34 zeros(1,9);
    88 02 77 73 07 63 67 zeros(1,8);
    99 65 04 28 06 16 70 92 zeros(1,7);
    41 41 26 56 83 40 80 70 33 zeros(1,6);
    41 48 72 33 47 32 37 16 94 29 zeros(1,5);
    53 71 44 65 25 43 91 52 97 51 14 zeros(1,4);
    70 11 33 28 77 73 17 78 39 68 17 57 0 0 0;
    91 71 52 38 17 14 91 43 58 50 27 29 48 0 0;
    63 66 04 68 89 53 67 30 73 16 69 87 40 31 0;
    04 62 98 27 23 09 70 98 73 93 38 53 60 04 23];


soma_tring(L, 75)