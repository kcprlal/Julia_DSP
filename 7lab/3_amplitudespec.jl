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
amplitude_spectrum(x::AbstractVector, w::AbstractVector=rect(length(x)))::Vector = missing