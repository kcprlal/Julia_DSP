using LinearAlgebra
using CairoMakie

    fp= 629
    x = [-0.61 + 0.44im, -0.53 - 0.22im, -0.53 - 0.69im, 0.69 + 0.38im, -0.24 - 0.13im, 0.99 - 0.23im, -0.5 - 1.14im, -0.75 - 0.09im, 0.54 + 0.23im, -0.05 + 0.29im, -0.16 - 0.4im, -0.25 - 0.28im, -0.56 - 0.08im, -1.29 - 0.88im, -0.61 - 0.34im, 0.78 + 1.14im, -2.23 + 0.29im, 1.06 - 1.03im, 0.11 + 0.05im, -0.87 - 0.2im, -0.11 - 0.97im, -0.28 - 0.2im, 0.69 - 1.02im, 0.85 - 0.77im, 0.68 - 0.15im, 0.37 - 0.79im, -0.03 - 0.35im, -0.13 - 1.92im, -0.24 - 0.82im, -0.22 - 0.5im, 0.29 - 0.1im, 0.2 + 0.33im, -0.42 - 0.09im, -0.23 + 0.19im, -0.05 - 0.22im, -0.74 - 0.71im, 0.06 + 0.2im]

    
    N = length(x)
    delta_f = fp/N
   
    F = zeros(Float64, N)

    F[Int(N / 2 + 0.5)] = -(N / 2 + 0.5)*delta_f
    
    for i in 1:N-1  
        F[i+1] == 0 ?  F[i+1] = F[i] + delta_f : continue
    end
    t=LinRange(0,5,37)
    scatter(t,F)
    
    
