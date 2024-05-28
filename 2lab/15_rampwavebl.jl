    using Printf

function ramp_wave_bl(t::Real, A::Real, T::Real, B::Real)::Real
    signal = 0.0
    temp = 0.0
    n = 1
    while (arg = 2π * n / T) < B * 2π
        temp += (-1)^n * sin(arg * t) / n
        n += 1
    end
    signal = -2 * A / π * temp
    return signal
end

# Example usage
t_values = LinRange(-2, 2, 1000)
A = 1.0
T = 1.0
B = 20.0

# Generate the signal values
signal_values = [ramp_wave_bl(t, A, T, B) for t in t_values]

using CairoMakie
lines(t_values, signal_values, color=:blue, linewidth=2)

