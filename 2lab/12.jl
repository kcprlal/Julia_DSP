using CairoMakie

function cw_rectangular(t::AbstractVector)::Vector{Float64}
    sygn = similar(t, Float64)  # Inicjalizacja wektora wynikowego
    for (i, ti) in enumerate(t)
        sygn[i] = sign(sin(pi*(ti+0.5)))
    end
    return sygn
end

t = LinRange(-2, 2, 1000)
sygn = cw_rectangular(t)
lines(t, sygn)