function idft(X::AbstractVector)::Vector
    N=length(X)
    result = zeros(N)
    for k in 0:N-1
        A=0
        for n in 0:N-1
            A+=X[n+1]*exp(im*(2π/N)*k*n)
        end
        result[k+1]=round(A;digits=10)
    end
    return result
 end

x=[70.8 - 0.0im
16.4678787077 - 14.8364816542im
-1.8678787077 - 9.1694499358im
-1.8678787077 + 9.1694499358im
16.4678787077 + 14.8364816542im]
y=idft(x)