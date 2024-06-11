function square_wave_bl(t; A=1.0, T=1.0, band=20.0)
    signal = 0.0
    ω = 2 * π / T  # Inicjalizacja wektora wynikowego
    k = 1
    while (ω*k) < band *2π
        signal += 4*A/π*1/(2k-1)*sin(ω*(2k-1)*t)
        k += 1
    end
    return signal
end
t = 0.5
A = 1.0
T = 1.0
B = 5.0
println(ramp_wave_bl(0.25))