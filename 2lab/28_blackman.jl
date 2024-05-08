using CairoMakie
blackman(N::Integer)::AbstractVector{<:Real} = 0.42 .- 0.5 .*cos.(2π*LinRange(0,N-1,N)/(N-1)).+0.08 .*cos.(4π*LinRange(0,N-1,N)/(N-1))

N=100
sampl=LinRange(0,N-1,N)
lines(sampl,blackman(N))