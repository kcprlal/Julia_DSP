using CairoMakie

function triangular_wave(t::AbstractVector)::Vector{Float64}
    sygn = similar(t, Float64) 
    for (i, ti) in enumerate(t)
        sygn[i] = ifelse(mod(ti + 1 / 4, 1.0) < 1 / 2, 4 * mod(ti + 1 / 4, 1.0) - 1, -4 * mod(ti + 1 / 4, 1.0) + 3)
    end
    return sygn
end

t = LinRange(-1, 1, 1000)
sygn = triangular_wave(t)
lines(t, sygn)