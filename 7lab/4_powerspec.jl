rect(N::Integer)::AbstractVector{<:Real} = return ones(N)
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
rect(N::Integer)::AbstractVector{<:Real} = return ones(N)

power_spectrum(x::AbstractVector, w::AbstractVector=rect(length(x)))::Vector = (abs.(dft(x.*w)).^2)./length(x)
x = Complex{Float64}[1.0 + 1.0im, 2.0 + 2.0im, 3.0 + 3.0im, 4.0 + 4.0im]
power_spectrum(x)