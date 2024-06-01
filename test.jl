using CairoMakie
#include("CPS.jl")
using FFTW
rect(N::Integer)::AbstractVector{<:Real} = return ones(N)
# Funkcja do obliczania widma amplitudowego
function amplitude(x::Vector{Complex}, w::Vector{Float64})::Vector{Float64}
    N = length(x)
    # Nałożenie okna na sygnał
    windowed_signal = x .* w
    # Obliczenie DFT sygnału
    X = fft(windowed_signal)
    # Obliczenie widma amplitudowego
    A = abs.(X) / N
    return A
end

# Przykładowe użycie
x = Complex{Float64}[1, 2, 3, 4, 5, 6, 7, 8]
w = rect(length(x))  # Okno Hamminga

A = amplitude(x, w)

# Wyświetlenie wyników
println("Widmo amplitudowe: ", A)
