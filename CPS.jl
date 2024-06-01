module CPS

using LinearAlgebra

# Sygnały ciągłe
cw_rectangular(t::Real; T=1.0)::Real = abs(t) <= T / 2 ? 1.0 : 0.0
cw_triangle(t::Real; T=1.0)::Real = abs(t) <= T ? (1.0 - abs(t)) : 0.0
cw_literka_M(t::Real; T=1.0)::Real = abs(t) <= T ? abs(t) : 0.0
cw_literka_U(t::Real; T=1.0)::Real = abs(t) <= T ? t^2 : 0.0


ramp_wave(t::Real)::Real = 2*rem(t,1,RoundNearest)
sawtooth_wave(t::Real)::Real = -2*rem(t,1,RoundNearest)
triangular_wave(t::Real)::Real = ifelse(mod(t + 1 / 4, 1.0) < 1 / 2, 4 * mod(t + 1 / 4, 1.0) - 1, -4 * mod(t + 1 / 4, 1.0) + 3)
square_wave(t::Real)::Real = ifelse(mod(t, 1) < 0.5, 1, -1)
pulse_wave(t::Real, ρ::Real=0.2)::Real = (0 <= mod(t, 1) <= ρ) ? 1.0 : 0.0
impuse_repeater(g::Function, t1::Real, t2::Real)::Function = fun -> g(mod(fun - t1, t2 - t1) + t1)

function ramp_wave_bl(t; A=1.0, T=1.0, band=20.0)
    signal = 0.0
    ω = 2π / T
    n = floor(Int, B * T / 2)

    for k in 1:n
        signal += -2*A/π^2 * (-1)^k/k * sin(ω*k*t)
    end

    return signal
end

function sawtooth_wave_bl(t; A=1.0, T=1.0, band=20.0)
    signal = 0.0
    ω = 2π / T
    n = floor(Int, band * T / 2)

    for k in 1:n
        signal += 2*A/π^2 * (-1)^k/k * sin(ω*k*t)
    end

    return signal
end

function triangular_wave_bl(t; A=1.0, T=1.0, band=20.0)
    signal = 0.0
    n = floor(Int, band * T / 2)
    ω=2*π/T
    for k in 1:n
        signal += -8*A/π^2 * (-1)^k/(2*k-1)^2 * sin(ω*(2*k-1)*t)
    end

    return signal
end

function square_wave_bl(t; A=1.0, T=1.0, band=20.0)
    signal = 0.0
    n = floor(Int, band * T / 2)
    ω=2*π/T
    for k in 0:n
        signal += 4*A/π * 1/(2*k-1) * sin(ω*(2*k-1)*t)
    end

    return signal
end

function pulse_wave_bl(t; ρ=0.2, A=1.0, T=1.0, band=20.0)
    missing
end


function impuse_repeater_bl(g::Function, t0::Real, t1::Real, band::Real)::Function
    missing
end

function rand_siganl_bl(f1::Real, f2::Real)::Function
    missing
end



# Sygnały dyskretne
kronecker(n::Integer)::Real = n == 0 ? (return 1) : (return 0)
heaviside(n::Integer)::Real = n >= 0 ? (return 1) : (return 0)

# Okna
rect(N::Integer)::AbstractVector{<:Real} = return ones(N)
triang(N::Integer)::AbstractVector{<:Real} = 1 .- abs.((LinRange(0,N,N)))/(N+1)
hanning(N::Integer)::AbstractVector{<:Real} = 0.5 * (1 .+ cos.(2π * LinRange(0,N,N) / (2*N+1)))
hamming(N::Integer)::AbstractVector{<:Real} = 0.54 .+ 0.46 .*cos.(2π * LinRange(0,N,N) ./ (2*N+1))
blackman(N::Integer)::AbstractVector{<:Real} = 0.42 .+ 0.5 .*cos.(2π*LinRange(0,N,N)/(2*N+1)).+0.08 .*cos.(4π*LinRange(-N, N, 2*N+1)/(2*N+1))

# Parametry sygnałów
mean(x::AbstractVector)::Number = sqrt(sum(x .^ 2))
peak2peak(x::AbstractVector)::Real = maximum(x) - minimum(x)
energy(x::AbstractVector)::Real = sum(x .^ 2)
power(x::AbstractVector)::Real = energy(x) / length(x)
rms(x::AbstractVector)::Real = sqrt(power(x))

function running_mean(x::AbstractVector, M::Integer)::Vector
    N = length(x)
    wynik = zeros(Complex, N)

    for n in 1:N
        dolnagranica = max(1, n - M)
        gornagranica = min(N, n + M)
        suma = zero(Complex{Float64})

        for k in dolnagranica:gornagranica
            suma += x[k]
        end

        wynik[n] = suma / (2 * M + 1)
    end

    return wynik
end

function running_energy(x::AbstractVector, M::Integer)::Vector
    N = length(x)
    wynik = zeros(Complex, N)

    for n in 1:N
        dolnagranica = max(1, n - M)
        gornagranica = min(N, n + M)
        suma = zero(Complex{Float64})

        for k in dolnagranica:gornagranica
            suma += x[k]
        end

        wynik[n] = suma^2 / (2 * M + 1)
    end

    return wynik
end

function running_power(x::AbstractVector, M::Integer)::Vector
    N = length(x)
    wynik = zeros(Complex, N)

    for n in 1:N
        dolnagranica = max(1, n - M)
        gornagranica = min(N, n + M)
        suma = zero(Complex{Float64})

        for k in dolnagranica:gornagranica
            suma += x[k]
        end

        wynik[n] = suma^2 / ((2 * M + 1) * M)
    end

    return wynik
end



# Próbkowanie
function interpolate(
    t::Real;
    m::AbstractVector,
    s::AbstractVector,
    kernel::Function=sinc
)::Real
    return newf -> begin
        result = 0.0
        Δt = m[2] - m[1]
        for n in eachindex(m)
            result += s[n] * kernel((newf - m[n]) / Δt)
        end
        return result
    end
end

# Kwantyzacja
quantize(x::Real; L::AbstractVector)::Function = fun -> L[argmin(abs(x .- L))]
SQNR(N::Integer)::Real = 6.02 * N + 1.76 #w dB
SNR(Psignal, Pnoise)::Real = 10 * log10(Psignal / Pnoise)


# Obliczanie DFT
#nie dziala jak jest srednik
function dtft(f::Real; signal::AbstractVector, fs::Real)
    result::ComplexF64 = 0.0
    xlen = length(signal)
    ω = 2π * (f / fs)

    for n in eachindex(signal)
        result += signal[n] * exp(-1im * ω * n)
    end
    return round(result, digits=10)
end

function dft(x::AbstractVector)::Vector
    xlen = length(x)
    wynik = zeros(Complex, xlen)
    for k in 1:xlen
        A = 0
        for n in 1:xlen
            A += x[n] * exp(-2im * (π / xlen) * k * (n - 1))
        end
        wynik[xlen+1-k] = round(A; digits=10)
    end
    return wynik
end

function idft(X::AbstractVector)::Vector
    N = length(X)
    result = zeros(Complex, N)
    for k in 0:N-1
        A = 0
        for n in 0:N-1
            A += X[n+1] * (1 / N) * exp(im * (2π / N) * k * n)
        end
        result[k+1] = round(A; digits=10)
    end
    return result
end

function rdft(x::AbstractVector)::Vector
    N = length(x)
    index::Int = 0
    N % 2 != 0 ? index = ((N - 1) / 2) + 1 : index = ((N - 1) / 2) + 1 + 0.5

    result = zeros(Complex, index)
    for k in 0:index-1
        A = 0
        for n in 0:N-1
            A += x[n+1] * exp(-im * (2π / N) * k * n)
        end
        result[k+1] = round(A; digits=10)
    end
    return result
end

function irdft(X::AbstractVector, N::Integer)::Vector
    result = zeros(N)

    if N % 2 == 0
        for i in length(x)-2:-1:1
            push!(X, conj(X[i+1]))
        end
    else
        for i in length(x)-1:-1:1
            push!(X, conj(X[i+1]))
        end
    end

    for k in 0:N-1
        A = 0
        for n in 0:N-1
            A += X[n+1] * exp(im * (2π / N) * k * n)
        end
        result[k+1] = round(A; digits=10)
    end
    return result
end

function fft_radix2_dit_r(x::AbstractVector)::Vector
    N = length(x)

    if N <= 1
        return x
    end

    if N % 2 != 0
        throw(ArgumentError("x != 2^n"))
    end

    even = fft_radix2_dit_r(x[1:2:end])
    odd = fft_radix2_dit_r(x[2:2:end])

    result = similar(x)
    halfN = div(N, 2)
    for k in 1:halfN
        t = exp(-2im * π * (k - 1) / N) * odd[k]
        result[k] = even[k] + t
        result[k+halfN] = even[k] - t
    end

    return result
end

function ifft_radix2_dif_r(X::AbstractVector)::Vector
    N = length(X)

    if N <= 1
        return X
    end

    if N % 2 != 0
        throw(ArgumentError("X!=2^n"))
    end

    even = ifft_radix2_dif_r(X[1:2:end])
    odd = ifft_radix2_dif_r(X[2:2:end])

    result = zeros(ComplexF64, N)
    halfN = div(N, 2)
    for k in 1:halfN
        t = exp(2im * π * (k - 1) / N) * odd[k]
        result[k] = even[k] + t
        result[k+halfN] = even[k] - t
    end

    return result
end

function fft(x::AbstractVector)::Vector
    dft(x) # Może da rade lepiej?
end

function ifft(X::AbstractVector)::Vector
    idft(X) # Może da rade lepiej?
end

fftfreq(N::Integer, fs::Real)::Vector = [(n < N/2 ? n*(fs/N) : (n-N)*(fs/N)) for n in 0:(N-1)]
rfftfreq(N::Integer, fs::Real)::Vector = [n * (fs / N) for n in 0:(N-1)/2]
amplitude_spectrum(x::AbstractVector, w::AbstractVector=rect(length(x)))::Vector = missing
power_spectrum(x::AbstractVector, w::AbstractVector=rect(length(x)))::Vector = missing
psd(x::AbstractVector, w::AbstractVector=rect(length(x)), fs::Real=1.0)::Vector = missing

function periodogram(x::AbstractVector, w::AbstractVector=rect(length(x)), fs::Real=1.0)::Vector
    missing
end



function stft(x::AbstractVector, w::AbstractVector, L::Integer)::Matrix
    missing
end


function istft(X::AbstractMatrix{<:Complex}, w::AbstractVector{<:Real}, L::Integer)::AbstractVector{<:Real}
    missing
end

function conv(f::Vector, g::Vector)::Vector
    y = zeros(length(f) + length(g) - 1)
    ylen = length(y)
    for n in 1:ylen
        for k in max(1, n - length(g) + 1):min(n, length(f))
            y[n] += f[k] * g[n-k+1]
        end
    end

    return y
end

function fast_conv(f::Vector, g::Vector)::Vector
    missing
end

function overlap_add(x::Vector, h::Vector, L::Integer)::Vector
    missing
end

function overlap_save(x::Vector, h::Vector, L::Integer)::Vector
    missing
end

function lti_filter(b::Vector, a::Vector, x::Vector)::Vector
    missing
end

function filtfilt(b::Vector, a::Vector, x::Vector)::Vector
    missing
end

function lti_amp(f::Real, b::Vector, a::Vector)::Real
    missing
end

function lti_phase(f::Real, b::Vector, a::Vector)::Real
    missing
end

function firwin_lp_I(order, F0)
    missing
end

function firwin_hp_I(order, F0)
    missing
end

function firwin_bp_I(order, F1, F2)
    missing
end

function firwin_bs_I(order, F1, F2)
    missing
end

function firwin_lp_II(N, F0)
    missing
end

function firwin_bp_II(N, F1, F2)
    missing
end

end