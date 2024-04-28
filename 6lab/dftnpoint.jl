#dft n punktowa 
using CairoMakie
function dftnpoint(x::AbstractVector)::AbstractVector
   
    wynik = zeros(Complex,length(x))
    for i in 1:length(x)
        A=0
        for j in 1:length(x)
            A+=x[j]*exp(-im*(2π/length(x))*i*j)
        end
        wynik[5-i]=A
    end
    return wynik
end

x = [1,0,1,0]
y = dftnpoint(x)
