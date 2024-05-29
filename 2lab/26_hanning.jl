using CairoMakie

function hanning(N::Integer)::AbstractVector{<:Real} 
    n=LinRange(-N, N, 2*N+1)
    wynik= 0.5 * (1 .+ cos.(2π * n / (2*N+1)))

return wynik
end
N = 100
sampl = LinRange(-N, N, 2*N+1)
lines(sampl,hanning(N))
#hanning(N)
