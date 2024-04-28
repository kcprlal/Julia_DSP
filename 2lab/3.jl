include("CPS.jl")
using CairoMakie
function szumbialy(N::Int, power::Real)
    σ = sqrt(P)  # Odchylenie standardowe jest pierwiastkiem z mocy

    # Generacja próbek szumu o rozkładzie normalnym
    szum = σ * randn(N)

    return szum
end

N = 1000  # Liczba próbek
P = 0.25  # Moc szumu

szum = szumbialy(N, power)
t=LinRange(0,1000,N)
lines(t,szum)
println("moc szumu: ", CPS.power(szum))