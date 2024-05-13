
function dtft(f::Real, signal::AbstractVector, fs::Real)
    result::ComplexF64 = 0.0
    xlen=length(signal)
    ω=2π*(f/fs)

    for n in eachindex(signal)
        result += signal[n] * exp(-1im*ω*n)
    end
    return round(result,digits=10)
 end
 x = [26,40,7,30,39,38,13,42,15,36,32]
 f::Real=25
 fs::Real=10
y = dtft(f,x,fs)
