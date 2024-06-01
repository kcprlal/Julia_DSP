function square_wave_bl(t; A=1.0, T=1.0, band=20.0)
    signal = 0.0
    n = floor(Int, band * T / 2)
    ω=2*π/T
    for k in 0:n
        signal += 4*A/π * 1/(2*k-1) * sin(ω*(2*k-1)*t)
    end

    return signal
end
t = 0.5
A = 1.0
T = 1.0
B = 5.0
println(ramp_wave_bl(0.25))