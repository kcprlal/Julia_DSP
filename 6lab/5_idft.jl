function idft(X::AbstractVector)::Vector
    N=length(X)
    result = zeros(N)
    for k in 0:N-1
        A=0
        for n in 0:N-1
            A+=X[n+1]*(1/N)*exp(im*(2π/N)*k*n)
        end
        result[k+1]=round(A;digits=10)
    end
    return result
 end

x=[28.0 - 0.0im
-3.5 + 7.267824888im
-3.5 + 2.7911568611im
-3.5 + 0.7988521604im
-3.5 - 0.7988521604im
-3.5 - 2.7911568611im
-3.5 - 7.267824888im]
y=idft(x)