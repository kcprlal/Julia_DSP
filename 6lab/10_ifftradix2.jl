function ifft_radix2_dif_r(X::AbstractVector)::Vector
    N = length(X)
    
    if N <= 1
        return X;
    end
    
    if N % 2 != 0
        throw(ArgumentError("X!=2^n"))
    end
    
    even = ifft_radix2_dif_r(X[1:2:end])
    odd = ifft_radix2_dif_r(X[2:2:end])
    
    result = zeros(ComplexF64,N)
    halfN = div(N, 2)
    for k in 1:halfN
        t = exp(2im * π * (k-1) / N) * odd[k]
        result[k] = even[k] + t
        result[k + halfN] = even[k] - t
    end
    
    return result
 end
 x=[53.125 - 0.0im
 12.4742424049175 - 26.20064030267288im
-6.124999999999998 - 23.5im
-17.224242404917497 - 18.700640302672884im
          -28.375 + 0.0im
-17.2242424049175 + 18.70064030267288im
-6.125000000000002 + 23.5im
12.474242404917495 + 26.200640302672884im]
 nowa=ifft_radix2_dif_r(x)