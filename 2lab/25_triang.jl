using CairoMakie

triang(N::Integer)::AbstractVector{<:Real} = 1 .- abs.(((LinRange(0, N-1, N)) .- ((N-1)/2)) / ((N-1)/2))

N = 100
sampl = LinRange(0, N, N)
#lines(sampl, triang(N))
triang(N)

