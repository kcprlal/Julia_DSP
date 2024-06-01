function rozwiazanie(;
    fp::Int = 150,
    x::Vector{ComplexF64} = ComplexF64[0.96 + 0.18im, -0.45 - 0.75im, -1.36 + 0.72im, -1.84 - 0.55im, -0.01 - 0.42im, -0.45 - 0.97im, -0.38 + 0.29im, 0.65 - 0.36im, 0.35 + 0.13im, 1.39 + 1.78im, -0.66 - 0.35im, -0.08 + 1.0im, -0.3 - 0.16im, 0.35 - 0.37im, 0.04 + 0.92im, -0.77 - 0.33im, 1.1 - 0.17im, -0.53 + 0.51im, -0.31 - 0.2im, -0.66 + 0.65im, -1.12 + 0.19im, -0.23 - 0.86im, -0.7 + 0.33im, 0.06 + 0.23im, 0.74 + 0.82im],
    f::Vector{Int} = [-60, 54, -66],
)
    N=length(x)
    F=[k < N/2 ? k*fp/N : (k-N)*fp/N for k in 0:N-1]

    xdft=zeros(ComplexF64,N)
    for k in 0:N-1
        for n in 0:N-1
            xdft[k+1]+=x[n+1]*(1/N)*exp(-2im*π*n*k/N)
        end
    end
    result=0.0
    for i in 1:N
        if F[i] in f
            result+=angle(xdft[i])
        end
    end
    return result
end
rozwiazanie()