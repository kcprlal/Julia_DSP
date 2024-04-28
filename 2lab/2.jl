using CairoMakie

probki = 350
fp = 2048 # Hz, liczba probek na sekunde
amplituda = 2 + 1.50im
fs = pi / 2  # Hz, cz oscylacji
ϕ = pi  # przesuniecie fazowe
t = LinRange(5, 10, probki)   # Tworzenie wektora czasu
x = real(amplituda * sin.(2 * π * fs * t .+ ϕ))  # Obliczanie rzeczywistego sygnału harmonijnego
y = imag(amplituda * sin.(2 * π * fs * t .+ ϕ))
scatter(t, x)
scatter(t,y)