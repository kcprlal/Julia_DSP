#dft 4 punktowa

function dft4point(x::AbstractVector)::AbstractVector
   
    wynik = zeros(Complex,4)
    for i in 1:4
        A=0
        for j in 1:4
            A+=x[j]*exp(-im*(2π/4)*i*(j-1))
        end
        wynik[i]=round(A;digits=10)
    end
    return wynik
end

x = [3,2,5,1]
y = dft4point(x)
