using CairoMakie

function triangular_wave(t::AbstractVector)::Vector{Float64}
    sygn = similar(t, Float64) 
    for (i, ti) in enumerate(t)
        sygn[i] = 4*abs(ti-floor(ti+3/4)+1/4)-1
    end
    return sygn
end

t = LinRange(-1, 1, 1000)
sygn = triangular_wave(t)
lines(t, sygn)