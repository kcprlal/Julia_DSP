using CairoMakie

function cw_U(t::AbstractVector; T=1.0)::Vector{Float64}
    sygn = similar(t, Float64)  # Inicjalizacja wektora wynikowego
    for (i, ti) in enumerate(t)
        sygn[i] = abs(ti) <= T/2  ? 4*ti^2 : 0.0
    end
    return sygn
end

t = LinRange(-0.5, 0.5, 1000)
sygn = cw_U(t)
lines(t, sygn)