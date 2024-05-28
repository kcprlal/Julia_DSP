#dft n punktowa 

function dft(x::AbstractVector)::AbstractVector
   N=length(x)
    result = zeros(Complex,N)
    for k in 0:N-1
        A=0
        for n in 0:N-1
            A+=x[n+1]*(1/N)*exp(-im*(2π/N)*k*n)
        end
        result[k+1]=round(A;digits=10)
    end
    return result
end

x = [121, 23, 43, 21, 43,2]
@btime(dft(x))
