module pila

function cw_rectangular(t::AbstractVector; T=1.0)::Vector{Float64}
    sygn = similar(t, Float64)  # Inicjalizacja wektora wynikowego
    for (i, ti) in enumerate(t)
        sygn[i] = 1/2*atan(tan(ti))
    end
    return sygn
end

end