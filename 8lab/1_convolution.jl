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

# Przykładowe dane
x = [1, 1, 1,1,1,1]
h = [1, 2, 3]

# Obliczenie splotu
wynik = conv(x, h)
