using CairoMakie

hamming(N::Integer)::AbstractVector{<:Real} = 0.54 .- 0.46 .*cos.(2π * LinRange(0, N-1, N-1) ./ (N-1))

N = 100
sampl = LinRange(0, N-1, N-1)
lines(sampl, hamming(N))