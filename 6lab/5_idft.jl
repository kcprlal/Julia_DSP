function idft(X::AbstractVector)::Vector
    N=length(X)
    result = zeros(ComplexF64,N)
    for k in 0:N-1
        A=0
        for n in 0:N-1
            A+=X[n+1]*exp(im*(2π/N)*k*n)
        end
        result[k+1]=round(A;digits=10)
    end
    return result
 end

x=[0.0825 - 0.09249999999999997im
-0.7475 + 0.4874999999999999im
-0.2375 + 0.26249999999999996im
-0.7475 - 0.4874999999999999im]
y=idft(x)