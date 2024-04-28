using CairoMakie

hanning(N::Integer)::AbstractVector{<:Real} = 0.5 * (1 .- cos.(2π * LinRange(0, N-1, N-1) / (N-1)))

N = 100
sampl = LinRange(0, N-1, N-1)
lines(sampl, hanning(N))
