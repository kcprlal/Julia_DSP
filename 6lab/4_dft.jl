#dft n punktowa 

function dft(x::AbstractVector)::AbstractVector
    N = length(x)
    result = zeros(Complex, N)
    for k in 0:N-1
        A = 0
        for n in 0:N-1
            A += x[n+1] * (1 / N) * exp(-im * (2π / N) * k * n)
        end
        result[k+1] = A
    end
    return round(result;digits=5);
end

x = [1, 1, 0, 0, 0, 0, 0, 1]

dft(x)
