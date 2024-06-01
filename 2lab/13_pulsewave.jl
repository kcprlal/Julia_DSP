using CairoMakie

function pulse_wave(t::AbstractVector, ρ::Real=0.4)::Vector{Float64}
    sygn = similar(t, Float64)  # Inicjalizacja wektora wynikowego
    for (i, ti) in enumerate(t)
        sygn[i] = (0 <= mod(ti,1) <= ρ) ? 1.0 : 0.0
    end
    return sygn
end

t = LinRange(0, 1, 1000)
sygn = pulse_wave(t)
lines(t, sygn)