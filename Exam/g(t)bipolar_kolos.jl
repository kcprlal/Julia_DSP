function rozwiazanie(;
    fp::Float64 = 229.87,
    t1::Float64 = 9.93,
    N::Int = 516,
)
    # Funkcja generująca sygnał prostokątny
    g(t) = ifelse(mod(t, 1) < 0.5, 1, -1)
    
    # Generowanie wartości czasu
    t = LinRange(t1, t1 + (N-1)/fp, N)
    
    # Generowanie sygnału
    y = 3.9 .* g.(3.3 .* t .- 0.7)
    
    # Obliczanie wartości RMS
    power = sum(y.^2) / length(y)
    
    return power
end

# Wywołanie funkcji
result = rozwiazanie()
println("RMS: ", result)
