using FFTW

function overlap_add(x::Vector{Float64}, h::Vector{Float64}, L::Int)
    N = length(x)
    M = length(h)
    P = L + M - 1  # Długość segmentu powinna być większa lub równa długości sygnału + długości filtru - 1
    n = ceil(Int, N / L)  # Liczba segmentów

    hp = [h; zeros(P - M)]  # Zero-padding filtru

    y = zeros(Float64, N + M - 1)  # Wynikowy sygnał

    for k in 0:(n-1)
        st = k * L + 1
        en = min((k + 1) * L, N)
        fse = x[st:en]  # Wycięcie segmentu
        fp = vcat(fse, zeros(P - length(fse)))  # Zero-padding segmentu
        seconv = ifft(fft(fp) .* fft(hp))  # Splot w domenie częstotliwości
        y[st:st+P-1] += real(seconv)  # Dodanie do wynikowego sygnału
    end

    return y
end

# Przykład użycia
f = [13.0, 1.0, 3.0, 2.0, 43.0, 24.0, 3.0, 53.0, 4.0]  # Przykładowy sygnał
g = [3.0, 1.0, 23.0, 4.0, 4.0, 32.0, 2.0, 1.0, 1.0]   # Przykładowy filtr
L = 3  # Długość segmentu

conv_result = overlap_add(f, g, L)
println("Wynik splotu: ", conv_result)
