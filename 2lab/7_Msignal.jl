
using CairoMakie

function cw_M(t::AbstractVector; T=1.0)::Vector{Float64}
    sygn = similar(t, Float64)  # Inicjalizacja wektora wynikowego
    for (i, ti) in enumerate(t)
        sygn[i] = abs(ti) <= T ? abs(ti) : 0.0
    end
    return sygn
end

t = LinRange(-5, 5, 1000)
sygn = cw_M(t)
lines(t, sygn)