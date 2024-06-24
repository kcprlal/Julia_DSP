using FFTW

function overlap_save(x::Vector{Float64}, h::Vector{Float64}, L::Int)
    N = length(x)
    M = length(h)
    P = 2^ceil(Int, log2(L + M - 1))  # Długość segmentu

    # Dopasowanie długości sygnału wejściowego do długości filtru
    if N < P
        x = vcat(x, zeros(Float64, P - N))
        N = length(x)
    end
    
    # Zero-padding dla filtru
    h_padded = vcat(h, zeros(Float64, P - M))
    H = fft(h_padded)  # FFT filtru

    # Inicjalizacja wyniku
    y = zeros(Float64, N + M - 1)

    # Przetwarzanie segmentów
    for k in 0:L:(N + M - 2)
        # Wycinanie segmentu z sygnału
        segment = x[max(1, k+1-M+1):min(N, k+L)]
        segment_padded = vcat(zeros(Float64, P - length(segment)), segment)
        
        # FFT segmentu
        X_segment = fft(segment_padded)
        # Splot w domenie częstotliwości
        Y_segment = ifft(X_segment .* H)

        # Dodanie wyników do końcowego sygnału
        y_start = k + M
        y_end = min(k + P, N + M - 1)
        y[y_start:y_end] += real(Y_segment[M+1:end])
    end

    return y[1:N+M-1]  # Skrócenie wynikowego sygnału do odpowiedniej długości
end

# Przykład użycia
f = [13.0, 1.0, 3.0, 2.0, 43.0, 24.0, 3.0, 53.0, 4.0]  # Przykładowy sygnał
g = [3.0, 1.0, 23.0, 4.0, 4.0, 32.0, 2.0, 1.0, 1.0]   # Przykładowy filtr
L = 16  # Długość segmentu (musi być większa niż długość filtru)

conv_result = overlap_save(f, g, L)
println("Wynik splotu: ", conv_result)

