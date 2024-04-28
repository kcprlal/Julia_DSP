include("CPS.jl")
using CairoMakie
function zespolony_szum_bialy(N::Int, moc::Real)
    σ = sqrt(moc / 2)  # Odchylenie standardowe jest pierwiastkiem z połowy mocy

    # Generacja próbek z rozkładu normalnego dla części rzeczywistej i urojonej
    rzeczywisty = σ * randn(N)
    urojony = σ * randn(N)

    return rzeczywisty + urojony * im
end

N = 1000  # Liczba próbek
moc = 2.0  # Moc szumu

szum = zespolony_szum_bialy(N, moc)
