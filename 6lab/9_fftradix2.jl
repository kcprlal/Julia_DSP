function fft_radix2_dit_r(x::AbstractVector)::Vector
    normalize=length(x)
    function radix2ins(x::AbstractVector)::Vector
        N = length(x)
        if N <= 1
            return x;
        end
        
        if N % 2 != 0
            throw(ArgumentError("x!=2^n"))
        end
        
        even = radix2ins(x[1:2:end])
        odd = radix2ins(x[2:2:end])
        
        
        result = zeros(ComplexF64,N)
        halfN = div(N, 2)
        for k in 1:halfN
            t = exp(-2im * π * (k-1) / N) * odd[k]
            result[k] = (even[k] + t)
            result[k + halfN] = (even[k] - t)
        end
        
        return result
    end
    return radix2ins(x)/normalize
end
 x=[3,234,52,56,22,23,22,13]
 nowa=fft_radix2_dit_r(x)
