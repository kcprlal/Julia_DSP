using CairoMakie

hamming(N::Integer)::AbstractVector{<:Real} = (1-(25/46)) * (1 .- cos.(2π * LinRange(0, N-1, N-1) / (N-1)))

N = 100
sampl = LinRange(0, N-1, N-1)
lines(sampl, hamming(N))