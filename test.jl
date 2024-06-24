using FFTW

# Liczba współczynników filtra
N = 7

# Próbki w dziedzinie częstotliwości
H = [0, 0, 0, 1, 1, 0, 0]

# Obliczenie współczynników filtra za pomocą IFFT
h = ifft(H)

# Konwersja do rzeczywistych wartości (małe liczby zespolone mogą się pojawić)
h = real(h)
println("Współczynniki filtra FIR: ", h)
using FFTW

# Liczba współczynników filtra
N = 7

# Próbki w dziedzinie częstotliwości
H = [0, 0, 0, 1, 1, 0, 0]

# Obliczenie współczynników filtra za pomocą IFFT
h = ifft(H)

# Konwersja do rzeczywistych wartości (małe liczby zespolone mogą się pojawić)
h = real(h)
println("Współczynniki filtra FIR: ", h)

# Sygnał wejściowy
s = [2, -1, 5]

# Zer padding sygnału wejściowego do długości filtra
s_padded = vcat(s, zeros(N - length(s)))

# Filtracja sygnału
y = conv(h, s_padded)

println("Sygnał przefiltrowany: ", y)
using CairoMakie

# Wykres współczynników filtra
fig = Figure(resolution = (800, 400))
ax1 = Axis(fig[1, 1], title = "Współczynniki filtra FIR", xlabel = "n", ylabel = "h[n]")
bars!(ax1, 0:N-1, h, color = :blue)
fig

# Wykres sygnału wejściowego i wyjściowego
fig2 = Figure(resolution = (800, 400))
ax2 = Axis(fig2[1, 1], title = "Sygnał wejściowy i wyjściowy", xlabel = "n", ylabel = "Amplituda")
lines!(ax2, 0:length(s_padded)-1, s_padded, label = "Sygnał wejściowy", color = :blue)
lines!(ax2, 0:length(y)-1, y, label = "Sygnał wyjściowy", color = :red)
axislegend(ax2)
fig2
