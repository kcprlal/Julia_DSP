function rekurencja(n)
    suma=1
    for i in 1:n
        suma*=i
    end
    return suma
end

a=rekurencja(4)