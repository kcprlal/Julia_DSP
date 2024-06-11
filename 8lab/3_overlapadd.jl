using FFTW

function overlap_add(x::Vector{Float64}, h::Vector{Float64}, L::Int)
    M = length(h)
    N = L + M - 1

    padded_h = vcat(h, zeros(N - M))
    H = fft(padded_h)

    y = zeros(eltype(x), length(x) + M - 1)

    for k in 1:L:length(x)
        xk = x[k:min(k + L - 1, end)]
        padded_xk = vcat(xk, zeros(N - length(xk)))
        Xk = fft(padded_xk)
        Yk = ifft(H .* Xk)
        y[k:k+N-1] .+= Yk
    end

    return y[1:length(x)+M-1]
end

# Example usage
f = [13,1,3,2,43,24,3,53,4]  # Example signal
g = [3,1,23,4,4,32,2,1,1]   # Example filter
L = 3        # Segment length

conv_result = overlap_add(f, g, L)


