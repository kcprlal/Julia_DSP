module CPS

using LinearAlgebra

# Sygnały ciągłe
cw_rectangular(t::Real; T=1.0)::Real = abs(t)<=T/2 ? 1.0 : 0.0
cw_triangle(t::Real; T=1.0)::Real = abs(t) <= T  ? (1.0-abs(t)) : 0.0
cw_literka_M(t::Real; T=1.0)::Real = abs(t) <= T  ? abs(t) : 0.0
cw_literka_U(t::Real; T=1.0)::Real = abs(t) <= T  ? t^2-1 : 0.0

ramp_wave(t::Real)::Real = t-floor(t)
sawtooth_wave(t::Real)::Real = -t+floor(t)
triangular_wave(t::Real)::Real = 2/π*asin(sin(π*t))
square_wave(t::Real)::Real =  sign(sin(pi*(t+0.5)))
pulse_wave(t::Real, ρ::Real=0.2)::Real = (0 <= mod(t,1) <= ρ) ? 1.0 : 0.0
impuse_repeater(g::Function, t1::Real, t2::Real)::Function = g(t2-t1)

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

function rand_siganl_bl(f1::Real, f2::Real)::Function
    missing
end



# Sygnały dyskretne
kronecker(n::Integer)::Real = missing
heaviside(n::Integer)::Real = missing

# Okna
rect(N::Integer)::AbstractVector{<:Real} = missing
triang(N::Integer)::AbstractVector{<:Real} = missing
hanning(N::Integer)::AbstractVector{<:Real} = missing
hamming(N::Integer)::AbstractVector{<:Real} = missing
blackman(N::Integer)::AbstractVector{<:Real} = missing

# Parametry sygnałów
mean(x::AbstractVector)::Number = sqrt(sum(x.^2))
peak2peak(x::AbstractVector)::Real = maximum(x)-minimum(x)
energy(x::AbstractVector)::Real = sum(x.^2)
power(x::AbstractVector)::Real = energy(x)/length(x)
rms(x::AbstractVector)::Real = sqrt(power(x))

function running_mean(x::AbstractVector, M::Integer)::Vector
    
end

function running_energy(x::AbstractVector, M::Integer)::Vector
    missing
end

function running_power(x::AbstractVector, M::Integer)::Vector
    missing
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
end