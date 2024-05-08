module CPS

using LinearAlgebra

# Sygnały ciągłe
cw_rectangular(t::Real; T=1.0)::Real = abs(t)<=T/2 ? 1.0 : 0.0
cw_triangle(t::Real; T=1.0)::Real = abs(t) <= T  ? (1.0-abs(t)) : 0.0
cw_literka_M(t::Real; T=1.0)::Real = abs(t) <= T  ? abs(t) : 0.0
cw_literka_U(t::Real; T=1.0)::Real = abs(t) <= T  ? t^2 : 0.0

#zapytac sie o te 2 nizej!!!!!!!!!!!!!!
ramp_wave(t::Real)::Real = t-floor(t)
sawtooth_wave(t::Real)::Real = -t+floor(t)
triangular_wave(t::Real)::Real = 2/π*asin(sin(2*π*t))
square_wave(t::Real)::Real =  sign(sin(pi*(t+0.5)))
pulse_wave(t::Real, ρ::Real=0.2)::Real = (0 <= mod(t,1) <= ρ) ? 1.0 : 0.0
impuse_repeater(g::Function, t1::Real, t2::Real)::Function = fun -> g(mod(fun - t1, t2 - t1) + t1)

function ramp_wave_bl(t; A=1.0, T=1.0, band=20.0)
    missing
end

function sawtooth_wave_bl(t; A=1.0, T=1.0, band=20.0)
    missing
end

function triangular_wave_bl(t; A=1.0, T=1.0, band=20.0)
    missing
end

function square_wave_bl(t; A=1.0, T=1.0, band=20.0)
    missing
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
kronecker(n::Integer)::Real = n==0 ? (return 1) : (return 0)
heaviside(n::Integer)::Real = n>=0 ? (return 1) : (return 0)

# Okna
rect(N::Integer)::AbstractVector{<:Real} = return ones(N)
triang(N::Integer)::AbstractVector{<:Real} = 1 .- abs.(((LinRange(0, N-1, N)) .- ((N-1)/2)) / ((N-1)/2))
hanning(N::Integer)::AbstractVector{<:Real} = 0.5 * (1 .- cos.(2π * LinRange(0, N-1, N) / (N-1)))
hamming(N::Integer)::AbstractVector{<:Real} = 0.54 .- 0.46 .*cos.(2π * LinRange(0, N-1, N) ./ (N-1))
blackman(N::Integer)::AbstractVector{<:Real} = 0.42 .- 0.5 .*cos.(2π*LinRange(0,N-1,N)/(N-1)).+0.08 .*cos.(4π*LinRange(0,N-1,N)/(N-1))

# Parametry sygnałów
mean(x::AbstractVector)::Number = sqrt(sum(x.^2))
peak2peak(x::AbstractVector)::Real = maximum(x)-minimum(x)
energy(x::AbstractVector)::Real = sum(x.^2)
power(x::AbstractVector)::Real = energy(x)/length(x)
rms(x::AbstractVector)::Real = sqrt(power(x))

function running_mean(x::AbstractVector, M::Integer)::Vector
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

function running_energy(x::AbstractVector, M::Integer)::Vector
    N = length(x)
    wynik = zeros(Complex,N)

    for n in 1:N
        dolnagranica = max(1, n - M)
        gornagranica = min(N, n + M)
        suma = zero(Complex{Float64})
        
        for k in dolnagranica:gornagranica
            suma += x[k]
        end
        
        wynik[n] = suma^2 / (2*M + 1)
    end

    return wynik
end

function running_power(x::AbstractVector, M::Integer)::Vector
    N = length(x)
    wynik = zeros(Complex,N)

    for n in 1:N
        dolnagranica = max(1, n - M)
        gornagranica = min(N, n + M)
        suma = zero(Complex{Float64})
        
        for k in dolnagranica:gornagranica
            suma += x[k]
        end
        
        wynik[n] = suma^2 / ((2*M + 1)*M)
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
missing
end

# Kwantyzacja
quantize(x::Real; L::AbstractVector)::Real = missing
SQNR(N::Integer)::Real = missing
SNR(Psignal, Pnoise)::Real = missing


# Obliczanie DFT
function dtft(f::Real; signal::AbstractVector, fs::Real)
   missing
end

function dft(x::AbstractVector)::Vector
    missing
end

function idft(X::AbstractVector)::Vector
   missing
end

function rdft(x::AbstractVector)::Vector
   missing
end

function irdft(X::AbstractVector, N::Integer)::Vector
   missing
end

function fft_radix2_dit_r(x::AbstractVector)::Vector
   missing
end

function ifft_radix2_dif_r(X::AbstractVector)::Vector
   missing
end

function fft(x::AbstractVector)::Vector
    dft(x) # Może da rade lepiej?
end

function ifft(X::AbstractVector)::Vector
    idft(X) # Może da rade lepiej?
end

fftfreq(N::Integer, fs::Real)::Vector = missing
rfftfreq(N::Integer, fs::Real)::Vector = missing
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
    y = zeros(length(f)+length(g)-1)
    ylen=length(y)
    for n in 1:ylen
        for k in max(1, n - length(g) + 1):min(n, length(f))
            y[n] += f[k] * g[n - k + 1]
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


end