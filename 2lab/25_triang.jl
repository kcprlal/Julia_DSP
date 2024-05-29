using CairoMakie

function triang(N::Integer)::AbstractVector{<:Real}
    n=(LinRange(-N, N, 2*N+1))
wynik = 1 .- abs.(n)/(N+1)
end

N = 101
sampl = LinRange(-N, N, 2*N+1)
lines(sampl, triang(N))
#triang(N)

