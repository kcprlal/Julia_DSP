function rozwiazanie(;
    fp::Int = 2209,
    x::Vector{ComplexF64} = ComplexF64[0.21 - 0.09im, 0.62 - 1.21im, -0.13 + 1.38im, -0.15 + 0.88im, 0.76 - 0.74im, -0.16 + 1.41im, -0.15 - 0.23im, -0.87 + 0.09im, -0.55 + 0.61im, -0.06 - 0.64im, -1.02 - 0.06im, -1.21 - 1.15im, 0.76 - 0.26im, 0.02 + 1.4im, -0.05 + 0.65im, 0.12 - 0.17im, 0.19 - 0.34im, -0.82 + 0.14im, 1.14 + 0.44im, 1.21 - 0.33im, -0.22 + 0.35im, -0.2 + 0.27im, 0.94 + 1.01im, -0.67 + 0.14im, -0.29 + 0.9im, 0.17 + 0.14im, -0.52 - 0.1im, 0.59 - 0.36im, -0.15 + 1.38im, -0.23 - 0.47im, -0.12 + 0.01im, -0.97 + 0.36im, 0.94 + 0.4im, -0.55 - 0.28im, -0.52 - 0.66im, 0.08 + 0.18im, 0.34 + 0.47im, -1.05 + 0.78im, 0.59 - 0.28im, -0.5 - 0.44im, -0.31 + 0.32im, 0.62 - 0.6im, 0.39 + 0.13im, -1.76 - 1.05im, -0.71 - 0.31im, 0.04 + 1.23im, 1.13 - 1.12im],
    f::Vector{Int} = [-376, -329, 423, 893, 893],
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
    #for j in 1:length(f) #<- kiedy sa 2 rowne wartosci f
    for i in 1:N
        if F[i] in f#[j]
            result += abs(xdft[i])
            #result += angle(xdft[i]) 
        end
    end
    #end
    return result
end

rozwiazanie()
