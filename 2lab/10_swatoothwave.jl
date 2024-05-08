using CairoMakie

function sawtooth_wave(t::AbstractVector; T=1.0)::Vector{Float64}
    sygn = similar(t, Float64)  # Inicjalizacja wektora wynikowego
    for (i, ti) in enumerate(t)
        sygn[i] = -ti+floor(ti)
    end
    return sygn
end

t=LinRange(-1,1,1000)
lines(t,sawtooth_wave(t))