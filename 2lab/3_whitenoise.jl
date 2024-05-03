include("CPS.jl")
using CairoMakie
function szumbialy(N::Int, power::Real)
    σ = sqrt(P)

    szum = σ * randn(N)

    return szum
end

N = 1000  
P = 0.25  

szum = szumbialy(N, power)
t=LinRange(0,1000,N)
lines(t,szum)
println("moc szumu: ", CPS.power(szum))