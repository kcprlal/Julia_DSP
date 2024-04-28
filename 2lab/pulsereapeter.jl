using CairoMakie
include("CPS.jl")
function cw_pulse(g::Function, t1::Real, t2::Real)::Vector{Float64}
    sygn = similar(t, Float64)  # Inicjalizacja wektora wynikowego
    for (i, ti) in enumerate(t)
        sygn[i] = g(t2-t1)
    end
    return sygn
end

t = LinRange(-2, 2, 1000)
sygn = cw_pulse(CPS.triangular_wave,1,2)
lines(t, sygn)