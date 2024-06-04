function pulse_wave_bl(t; ρ=0.2, A=1.0, T=1.0, band=20.0)
    sygn = similar(t, Float64) 
    for (i, ti) in enumerate(t)
        sygn[i] =  (sawtooth_wave_bl(ti - (T / 2); A, T, band) - sawtooth_wave_bl(ti - ((T / 2) + ρ); A, T, band)) + (2 * A * ρ)
    end
    return sygn
end

function ramp_wave_bl(t; A=1.0, T=1.0, band=20.0)
    signal = 0.0
    ω = 2π / T
    n = floor(Int, band * T / 2)

    for k in 1:n
        signal += 2*A/π^2 * (-1)^k/k * sin(ω*k*t)
    end

    return signal
end

t = LinRange(-1, 1, 1000)
sygn = pulse_wave_bl(t)
lines(t, sygn)