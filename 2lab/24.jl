using CairoMakie
rect(N::Integer)::AbstractVector{<:Real} = ones(N)
N=10
sampl=LinRange(0,N,N)
lines(sampl,rect(N))