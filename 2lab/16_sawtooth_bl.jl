function sawtooth_wave_bl(t; A=1.0, T=1.0, band=20.0)
    signal = 0.0
    ω = 2π / T
    n = floor(Int, band * T / 2)

    for k in 1:n
        signal += 2*A/π^2 * (-1)^k/k * sin(ω*k*t)
    end

    return signal
end

# Przykład użycia
t = 0.5
A = 1.0
T = 1.0
B = 5.0
println(sawtooth_wave_bl(0.5))
