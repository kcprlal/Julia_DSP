using CairoMakie

function triang(N::Integer)::AbstractVector{<:Real}
    n=(LinRange(0,N,N))
wynik = 1 .- abs.(n)/(N+1)
end

N = 5
sampl = LinRange(0,N,N)
lines(sampl, triang(N))
#triang(N)

