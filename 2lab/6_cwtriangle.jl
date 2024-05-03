using CairoMakie

triang(N::Integer) = 1 .- abs.(((LinRange(0, N-1, N-1)) .- ((N-1)/2)) / ((N-1)/2))

N = 100
sampl = LinRange(0, N-1, N-1)
lines(sampl, triang(N))

