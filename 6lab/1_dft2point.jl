#dft 2 punktowa
function dft2point(x::AbstractVector)::AbstractVector
   
    wynik = zeros(Complex,2)
    for i in 1:2
        A=0
        for j in 1:2
            A+=x[j]*exp(-im*(2π/2)*i*(j-1))
        end
        wynik[i]=round(A;digits=10)
    end
    return wynik
end

x = [20,5]
y = dft2point(x)
