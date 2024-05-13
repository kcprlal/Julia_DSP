#dft n punktowa 

function dft(x::AbstractVector)::AbstractVector
   N=length(x)
    result = zeros(Complex,N)
    for k in 0:N-1
        A=0
        for n in 0:N-1
            A+=x[n+1]*exp(-im*(2π/N)*k*n)
        end
        result[k+1]=round(A;digits=10)
    end
    return result
end

x = [26,40,7,30,39]
y = dft(x)
