using CairoMakie
function blackman(N::Integer)::AbstractVector{<:Real} 
    n=LinRange(0,N,N)
    wynik= 0.42 .+ 0.5 .*cos.(2π*n/(2*N+1)).+0.08 .*cos.(4π*n/(2*N+1))
return wynik
end
N=100
sampl=LinRange(0,N,N)
lines(sampl,blackman(N))