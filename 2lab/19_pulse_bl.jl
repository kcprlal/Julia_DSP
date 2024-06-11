using CairoMakie

function pulse_wave_bl(t; ρ=0.2, A=1.0, T=1.0, band=20.0)
    signal = zeros(Float64, length(t))
    for (i, ti) in enumerate(t)
        signal[i] = (sawtooth_wave_bl(ti - (T / 2); A, T, band) - sawtooth_wave_bl(ti - ((T / 2) + ρ); A, T, band)) + (2 * A * ρ)
    end
    return signal/2
end

function sawtooth_wave_bl(t; A=1.0, T=1.0, band=20.0)
    signal = 0.0
    ω = 2 * π / T  # Inicjalizacja wektora wynikowego
    k = 1
    while (ω*k) < band *2π
        signal += 2*A/π * (-1)^k * sin(ω*k*t)/k
        k += 1
    end
    return signal
end

# Funkcja do rysowania wykresu
function plot_pulse_wave_bl(ρ=0.2, A=1.0, T=1.0, band=20.0; duration=1.0, samples=1000)
    t = LinRange(0, duration, samples)
    y = pulse_wave_bl(t, ρ=ρ, A=A, T=T, band=band)

    fig = Figure()
    ax = Axis(fig[1, 1], title="Pulse Wave with Band-Limited Frequency", xlabel="Time (s)", ylabel="Amplitude")
    lines!(ax, t, y)
    return fig
end

# Przykładowe użycie:
ρ = 0.2
A = 6.0
T = 1.0
band = 20.0

fig = plot_pulse_wave_bl(ρ, A, T, band)
display(fig)
