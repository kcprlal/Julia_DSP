function irdft(X::AbstractVector, N::Integer)::Vector
    result=zeros(N)
    
    if N%2==0
        for i in length(x)-2:-1:1
            push!(X,conj(X[i+1]))
        end
    else
        for i in length(x)-1:-1:1
            push!(X,conj(X[i+1]))
        end
    end
    
    for k in 0:N-1
        A=0
        for n in 0:N-1
            A+=X[n+1]*exp(im*(2π/N)*k*n)
        end
        result[k+1]=round(A;digits=10)
    end
    return result
 end
 x=[21.0 - 0.0im
 -3.0 + 5.1961524227im
 -3.0 + 1.7320508076im
 -3.0 - 0.0im]
 N=6 #docelowa długość (czy przed transformata byl parzysty czy nie)
 y=irdft(x,N)