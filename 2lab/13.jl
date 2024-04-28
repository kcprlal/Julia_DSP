using CairoMakie

function cw_pulse(t::AbstractVector, ρ::Real=0.5)::Vector{Float64}
    sygn = similar(t, Float64)  # Inicjalizacja wektora wynikowego
    for (i, ti) in enumerate(t)
        sygn[i] = (0 <= mod(ti,1) <= ρ) ? 1.0 : 0.0
    end
    return sygn
end

t = LinRange(-2, 2, 1000)
sygn = cw_pulse(t)
lines(t, sygn)