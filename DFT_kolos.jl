using LinearAlgebra
using CairoMakie

function rozwiazanie(;
    fp::Int = 870,
    x::Vector{ComplexF64} = ComplexF64[-0.44 + 0.09im, 0.01 + 0.57im, 0.21 - 0.05im, 0.05 + 0.64im, -0.96 - 0.88im, -0.26 - 0.83im, -0.6 - 0.22im, -0.8 - 0.32im, -0.07 - 0.98im, 0.18 - 0.14im, 0.01 + 1.07im, 0.35 + 0.66im, 0.11 + 1.87im, 1.11 - 0.72im, 0.38 - 0.12im, -1.18 - 1.33im, -0.14 - 0.69im, 0.9 + 0.41im, -0.68 - 0.66im, -0.11 - 0.11im, 0.08 - 0.78im, -0.61 + 0.48im, -0.84 + 1.19im, -0.43 + 0.45im, 0.81 - 0.01im, -1.47 + 0.27im, -0.13 + 1.07im, 0.63 - 0.93im, -0.57 + 0.08im],
    f::Vector{Int} = [0, -420, -60, 390, 150],
)
    N = length(x)
    Δf = fp / N

    F = zeros(N)

    N % 2 == 0 ? F[Int(N / 2 + 1)] = -(N / 2) * Δf : F[Int(N / 2 + 0.5)] = -(N / 2 + 0.5) * Δf

    for i in 1:N-1
        F[i+1] == 0 ? F[i+1] = F[i] + Δf : continue
    end

    xdft = zeros(ComplexF64, length(x))
    for k in 0:N-1
        for n in 0:N-1
            xdft[k+1] += x[n+1] *(1/N)* exp(-im * 2 * pi / N)^(k * n)
        end
    end

    result = 0.0

    for i in 1:N
        if F[i] in f
            result += abs(xdft[i])
            #result += angle(xdft[i]) 
        end
    end

    return result
end

rozwiazanie()
