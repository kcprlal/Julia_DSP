using CairoMakie

function hamming(N::Integer)::AbstractVector{<:Real}
    n=LinRange(0,N,N)
    wynik = 0.54 .+ 0.46 .*cos.(2π * n ./ (2*N+1))
    return wynik
end
N = 100
sampl = LinRange(0,N,N)
lines(sampl, hamming(N))