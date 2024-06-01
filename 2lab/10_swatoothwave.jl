using CairoMakie

function sawtooth_wave(t::AbstractVector; T=1.0)::Vector{Float64}
    sygn = similar(t, Float64)  # Inicjalizacja wektora wynikowego
    for (i, ti) in enumerate(t)
        sygn[i] = -2*rem(ti,1,RoundNearest)
    end
    return sygn
end

t=LinRange(-2,2,1000)
lines(t,sawtooth_wave(t))