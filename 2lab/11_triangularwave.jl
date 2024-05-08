using CairoMakie

function triangular_wave(t::AbstractVector)::Vector{Float64}
    sygn = similar(t, Float64) 
    for (i, ti) in enumerate(t)
        sygn[i] = 2/π*asin(sin(π*ti))
    end
    return sygn
end

t = LinRange(-1, 1, 1000)
sygn = triangular_wave(t)
lines(t, sygn)