#ramp_wave
using CairoMakie

function ramp_wave(t::AbstractVector)::Vector{Float64}
    sygn = similar(t, Float64)  # Inicjalizacja wektora wynikowego
    for (i, ti) in enumerate(t)
        sygn[i] = 2*rem(ti,1,RoundNearest)
    end
    return sygn
end

t = LinRange(0, 1, 1000)
sygn = ramp_wave(t)
lines(t, sygn)