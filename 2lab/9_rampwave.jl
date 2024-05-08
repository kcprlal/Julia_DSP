#ramp_wave
using CairoMakie

function ramp_wave(t::AbstractVector)::Vector{Float64}
    sygn = similar(t, Float64)  # Inicjalizacja wektora wynikowego
    for (i, ti) in enumerate(t)
        sygn[i] = ti-floor(ti)
    end
    return sygn
end

t = LinRange(-2, 2, 1000)
sygn = ramp_wave(t)
lines(t, sygn)