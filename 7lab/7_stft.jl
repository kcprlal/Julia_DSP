using FFTW

"""
    stft(x::Vector{Float64}, w::Vector{Float64}, L::Int) -> Matrix{Complex{Float64}}

Short-time Fourier transform (STFT) of the signal `x` using window `w` with overlap `L`.
Arguments:
- `x`: The input signal as a vector of real numbers.
- `w`: The window function as a vector of real numbers.
- `L`: The overlap between consecutive windows in samples.

Returns:
- A matrix of complex numbers representing the STFT of the signal.
"""
hanning(N::Integer)::AbstractVector{<:Real} = 0.5 * (1 .+ cos.(2π * LinRange(0,N,N) / (2*N+1)))

function stft(x::Vector{Float64}, w::Vector{Float64}, L::Int)
    K = length(w)
    N = length(x)
    step = K - L
    num_segments = cld(N - L, step)  # Number of segments
    
    # Prepare the output matrix
    stft_matrix = Matrix{Complex{Float64}}(undef, div(K, 2) + 1, num_segments)

    # Perform the STFT
    segment_index = 1
    for i in 1:step:(N - K + 1)
        segment = x[i:i+K-1] .* w   # Windowing
        segment_fft = rfft(segment)  # Real FFT
        stft_matrix[:, segment_index] = segment_fft
        segment_index += 1
    end

    return stft_matrix
end

# Example usage
x = randn(1024)  # Example signal
w = hanning(256) # Example window
L = 128          # Example overlap

stft_result = stft(x, w, L)
println(size(stft_result))  # Output the size of the STFT result
  # Output the size of the STFT result
