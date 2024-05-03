function conv(x::Vector, h::Vector)::Vector
    y = zeros(length(x)+length(h)-1)

    for n in 1:length(y)
        for k in max(1, n - length(h) + 1):min(n, length(x))
            y[n] += x[k] * h[n - k + 1]
        end
    end

    return y
end

# Przykładowe dane
x = [1, 1, 1,1,1,1]
h = [1, 2, 3]

# Obliczenie splotu
wynik = conv(x, h)
