function idft(X::AbstractVector)::Vector
    N=length(X)
    result = zeros(ComplexF64,N)
    for k in 0:N-1
        A=0
        for n in 0:N-1
            A+=X[n+1]*(1/N)*exp(im*(2π/N)*k*n)
        end
        result[k+1]=round(A;digits=10)
    end
    return result
 end

x=[3,0,1,-im,im,1,0]
y=idft(x)