function conv(f::Vector, g::Vector)::Float64
    y = zeros(Float64,length(f)+length(g)-1)
    ylen=length(y)
    for n in 1:ylen
        for k in max(1, n - length(g) + 1):min(n, length(f))
            y[n] += f[k] * g[n - k + 1]
        end
    end

    return sum(y.^2)
end

# Przykładowe dane
x=[2.7, -3.51, 3.34, -3.94, 3.77, 4.02, 0.0, 1.62, -2.47, -2.06, 1.13, 0.87, -2.5, -0.96, -1.35, -1.47, -0.5, -3.13, 1.89, -2.1, 1.73, 3.28, 2.66, -0.77, 2.01, 3.66, -1.21, -4.0, 1.6, 3.35, 3.43, 1.72, -1.23, 4.95, -0.57, -3.3, -0.32, -2.68, -3.26, -4.23, -4.65, 2.56, -4.8, 1.99, 1.36, 4.06, -2.78, -1.04, -2.44, 4.84, 2.5, -1.48, 2.86, 1.6, 0.71, -1.9, -3.22, 0.15, -4.23, -0.3, 2.21, 0.32, -4.88, -1.67, 3.85, -4.37, 0.05, 3.44, -2.71]
h=[-4.81, 4.18, -1.56, -3.35, 3.63, 2.73, 2.5, -1.57, -4.17, -2.95, 2.05, 2.5, -4.25, -1.95, -2.86, -3.12, -4.87, -0.76]


# Obliczenie splotu
wynik = conv(x, h)
