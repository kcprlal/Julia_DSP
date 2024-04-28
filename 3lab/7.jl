function running_energy(x::AbstractVector, M::Int)::Vector
    N = length(x)
    wynik = zeros(Complex,N)

    for n in 1:N
        dolnagranica = max(1, n - M)
        gornagranica = min(N, n + M)
        suma = zero(Complex{Float64})
        
        for k in dolnagranica:gornagranica
            suma += x[k]
        end
        
        wynik[n] = suma / (2*M + 1)
    end

    return wynik
end
x=[1+4im,2,3+7im,4,5]
a=running_energy(x,3)