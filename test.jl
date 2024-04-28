using CairoMakie

function ramp_wave(t::Real)
    period = 1.0  # Okres fali
    amplitude = 1.0  # Amplituda fali
    constant = 0.0  # Składowa stała fali
    
    # Normalizacja czasu do przedziału [0, period)
    t_normalized = mod(t, period)
    
    # Obliczenie wartości funkcji w punkcie t
    if 0 <= t_normalized < 0.5
        return 2 * t_normalized
    else
        return 2 * (t_normalized - 1)
    end
end

function sawtooth_wave(t::Real)
    period = 1.0  # Okres fali
    amplitude = 1.0  # Amplituda fali
    constant = 0.0  # Składowa stała fali
    
    # Normalizacja czasu do przedziału [0, period)
    t_normalized = mod(t, period)
    
    # Obliczenie wartości funkcji w punkcie t
    return 2 * (t_normalized - floor(t_normalized + 0.5))
end

# Przygotowanie danych
t_values = LinRange(0, 1, 1000)
ramp_values = ramp_wave.(t_values)
sawtooth_values = sawtooth_wave.(t_values)

# Tworzenie wykresu
lines(t_values, ramp_values, color=:blue, label="Ramp Wave")
#lines!(t_values, sawtooth_values, color=:red, label="Sawtooth Wave")
current_figure()
