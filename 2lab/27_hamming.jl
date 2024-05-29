using CairoMakie

function hamming(N::Integer)::AbstractVector{<:Real}
    n=LinRange(-N, N, 2*N+1)
    wynik = 0.54 .+ 0.46 .*cos.(2π * n ./ (2*N+1))
    return wynik
end
N = 100
sampl = LinRange(-N, N, 2*N+1)
lines(sampl, hamming(N))