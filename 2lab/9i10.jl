#ramp_wave
using CairoMakie

function cw_rectangular(t::AbstractVector)::Vector{Float64}
    sygn = similar(t, Float64)  # Inicjalizacja wektora wynikowego
    for (i, ti) in enumerate(t)
        sygn[i] = -ti+floor(ti)
    end
    return sygn
end

t = LinRange(-1, 1, 1000)
sygn = cw_rectangular(t)
lines(t, sygn)