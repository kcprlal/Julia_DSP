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
function periodogram(
    x::AbstractVector,
    w::AbstractVector=rect(length(x)),
    L::Integer = 0,
    fs::Real=1.0)::Vector
    N = length(x)
    K = length(w)
    delta = K - L
    num = (N-K)÷delta + 1
    psd = zeros(Complex, K)

    for i in 1:num
        seg = x[(i-1)*delta + 1 : (i-1)*delta + K]
        window_seg = seg .* w
        seg_fft = dft(window_seg)
        psd .+= abs2.(seg_fft)/(sum(abs2.(w))*fs)
    end

    psd ./= num

    return psd[1:K÷2 + 1]
end

x = [1, 2, 4, 1, 4, 6]
println(periodogram(x))