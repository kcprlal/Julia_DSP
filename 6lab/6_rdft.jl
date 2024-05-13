function rdft(x::AbstractVector)::Vector
    N=length(x)
    index::Int=0
    N%2!=0 ? index=((N-1)/2)+1 : index=((N-1)/2)+1+0.5
    
    result = zeros(Complex,index)
    
    for k in 0:index-1
        A=0
        for n in 0:N-1
            A+=x[n+1]*exp(-im*(2π/N)*k*n)
        end
        result[k+1]=round(A;digits=10)
    end
    return result
 end
 x = [1,2,3,4,5,6]
y = rdft(x)