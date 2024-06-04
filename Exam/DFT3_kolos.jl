function rozwiazanie(;
    fp::Int = 72,
    x::Vector{ComplexF64} = ComplexF64[0.71 + 0.13im, -0.13 - 0.26im, 0.63 + 1.38im, -0.25 - 0.66im, -0.75 - 0.57im, 0.39 - 0.8im, -0.06 - 0.01im, 0.53 + 0.83im, -0.26 - 0.98im, -0.67 - 0.11im, -0.55 - 0.96im, -1.73 + 1.05im, 0.02 + 0.77im, 1.21 + 0.89im, -0.5 + 0.4im, 0.24 + 0.67im, -0.06 - 1.49im, 0.34 + 0.24im, -0.47 - 0.12im, 0.7 - 0.82im, 0.5 - 0.21im, -0.83 + 0.19im, 0.44 - 0.47im, 1.13 + 0.4im, 0.36 - 0.29im, -0.7 - 0.06im, 0.01 - 0.09im, 0.07 + 0.5im, -0.47 + 0.49im, 0.54 + 0.25im, 0.17 + 0.19im, 0.76 - 0.34im, 0.18 + 0.88im, 0.01 - 0.53im, -0.26 + 0.71im, 1.1 - 0.23im],
    f::Vector{Int} = [-2, 6, -28, 2, 32],
)
   N=length(x)
   F=[k<N/2 ? k*fp/N : (k-N)*fp/N for k in 0:N-1]
   xdft=zeros(ComplexF64, N)
   for k in 0:N-1
    for n in 0:N-1
        xdft[k+1]+=x[n+1]*(1/N)*exp(-2im*pi*k*n/N)
    end
   end
   wynik=0.0
   for i in 1:N
    if F[i] in f
        wynik+=abs(xdft[i])
    end
end
    return wynik
end
rozwiazanie()