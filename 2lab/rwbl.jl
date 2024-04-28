function ramp_wave_bl(t; A::Real=1.0, T::Real=1.0, band::Real=20.0)::Vector{Float64}
    f_max = band / 2
    δf = f_max / T
    
    # Wyrażenie definiujące sygnał
    signal(t) = A * (t / T) * (abs(mod(t, T)) < T / 2 ? 1 : -1)
    
    return [signal(ti) for ti in t]
end
t = LinRange(-10, 10, 1000)
sygn = ramp_wave_bl(t)
lines(t, sygn)