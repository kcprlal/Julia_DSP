fftfreqq(N::Int, fs::Float64)::Vector{Float64} = [(n < N/2 ? n*(fs/N) : (n-N)*(fs/N)) for n in 0:(N-1)]

