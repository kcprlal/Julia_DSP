using CairoMakie

function square_wave(t::AbstractVector)::Vector{Float64}
    sygn = similar(t, Float64)  
    for (i, ti) in enumerate(t)
        sygn[i] = sign(sin(pi*(ti+0.5)))
    end
    return sygn
end

t = LinRange(-2, 2, 1000)
sygn = square_wave(t)
lines(t, sygn)