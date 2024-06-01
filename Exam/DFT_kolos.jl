using LinearAlgebra
using CairoMakie

function rozwiazanie(;
    fp::Int = 846,
    x::Vector{ComplexF64} = ComplexF64[-1.23 - 0.65im, 1.05 + 0.21im, 0.21 - 0.76im, -1.1 + 0.16im, -1.14 + 0.14im, 0.39 - 0.45im, 0.65 + 0.94im, 0.17 + 0.78im, -0.18 + 1.19im, -1.07 - 0.04im, -0.37 + 0.85im, 0.36 - 0.32im, -0.43 + 0.4im, -0.48 - 0.08im, 0.64 + 0.8im, 0.37 + 0.5im, 0.66 - 1.16im, 0.03 + 1.37im, -0.69 + 0.56im, 0.58 - 0.49im, -0.02 - 0.41im, 1.18 + 0.13im, -1.18 - 0.5im, -0.85 - 0.27im, 0.64 + 1.27im, -0.19 + 0.76im, -0.89 - 0.04im, 0.45 + 1.02im, 0.61 + 0.85im, 0.94 - 0.12im, -0.15 + 1.38im, -0.7 - 0.07im, 0.92 + 0.64im, 0.95 + 0.42im, 1.23 + 0.35im, 1.03 + 0.82im, 0.53 - 0.0im, 0.1 - 0.43im, 0.11 - 0.7im, 0.47 + 0.66im, -0.72 - 0.26im, 1.54 - 2.33im, 0.15 + 0.22im, 0.78 - 1.18im, -0.08 - 0.66im, 0.76 + 0.06im, -0.57 + 0.27im],
    f::Vector{Int} = [-324, -36, -180, 0],
)
    N = length(x)
    
    F=[(k < N/2 ? k*(fp/N) : (k-N)*(fp/N)) for k in 0:(N-1)]

    xdft = zeros(ComplexF64, length(x))
    for k in 0:N-1
        for n in 0:N-1
            xdft[k+1] += x[n+1] *(1/N)* exp(-im * 2 * pi / N)^(k * n)
        end
    end

    result = 0.0

    for i in 1:N
        if F[i] in f
            #result += abs(xdft[i])
            result += angle(xdft[i]) 
        end
    end

    return result
end

rozwiazanie()
