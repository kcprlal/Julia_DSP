function idft(X::AbstractVector)::Vector
    N=length(X)
    result = zeros(Complex,N)
    for k in 0:N-1
        A=0
        for n in 0:N-1
            A+=X[n+1]*(1/N)*exp(im*(2π/N)*k*n)
        end
        result[k+1]=round(A;digits=10)
    end
    return result
 end

x=[142.0 - 0.0im
20.4787137637 + 12.5680042864im
-26.4787137637 - 22.4620851271im
-26.4787137637 + 22.4620851271im
20.4787137637 - 12.5680042864im]
y=idft(x)