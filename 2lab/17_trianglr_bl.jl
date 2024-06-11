function ramp_wave_bl(t; A=1.0, T=1.0, band=20.0)
    signal = 0.0
    ω = 2 * π / T  # Inicjalizacja wektora wynikowego
    k = 1
    while (ω*k) < band *2π
        signal += -8*A/(π^2)*(-1)^k/((2k-1)^k)*sin(ω*(2k-1)*t)
        k += 1
    end
    return signal
end

# Przykład użycia
t = 0.5
A = 1.0
T = 1.0
B = 5.0
println(ramp_wave_bl(0.25))