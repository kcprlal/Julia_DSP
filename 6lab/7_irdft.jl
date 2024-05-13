function irdft(X::AbstractVector, N::Integer)::Vector
    index::Int=0
    N%2!=0 ? index=((N-1)*2)+1 : index=(N-1)*2
    
    result = zeros(Complex,index)
    for k in 0:index-1
        A=0
        for n in 0:N-1
            A+=X[n+1]*(1/N)*exp(im*(2π/N)*k*n)
        end
        result[k+1]=round(A;digits=10)
    end
    return result
 end
 x=[21.0 - 0.0im
 -3.0 + 5.1961524227im
 -3.0 + 1.7320508076im
 -3.0 - 0.0im]
 y=irdft(x,length(x))