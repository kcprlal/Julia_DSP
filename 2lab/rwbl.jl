function ramp_wave_bl(t::AbstractVector; A=1.0, T=1.0, band=10.0)
    signal = similar(t, Float64)
    for (i, ti) in enumerate(t)
        temp = 0.0
        n = 1
        while (arg = 2π * n * (1 / T)) < band * 2π
            temp += (-1)^n * sin(arg * ti) / n
            n += 1
        end
        signal[i] = -2A / π * temp
    end
    return signal
end
using CairoMakie

t = LinRange(0, 10, 1000)  # Przykładowy wektor czasu
signal = ramp_wave_bl(t)   # Obliczanie wartości funkcji dla danego wektora czasu

scatter(t, signal)  # Narysowanie wykresu
