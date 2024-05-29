function ramp_wave_bl(t; A=1.0, T=1.0, band=20.0)
    signal = 0
    temp = 0
    n = 1
    while (arg = 2π * n * (1 / T)) < band * 2π
        temp += (-1)^n * sin.(arg * t) / n
        n += 1
    end
    signal += -2A / π * temp
    return signal
end

# Przykład użycia
t = 0.5
A = 1.0
T = 1.0
B = 5.0
println(ramp_wave_bl(4))
