#dft n punktowa 

function dft(x::AbstractVector)::AbstractVector
   xlen=length(x)
    wynik = zeros(Complex,xlen)
    for k in 1:xlen
        A=0
        for n in 1:xlen
            A+=x[n]*exp(-2im*(π/xlen)*k*(n-1))
        end
        wynik[xlen+1-k]=round(A;digits=10)
    end
    return wynik
end

x = [26,40,7,30,39,38,13,42,15,36,32]
y = dft(x)
