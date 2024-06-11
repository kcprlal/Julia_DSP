#dft n punktowa 

function dft(x::AbstractVector)::AbstractVector
   N=length(x)
    result = zeros(Complex,N)
    for k in 0:N-1
        A=0
        for n in 0:N-1
            A+=x[n+1]*(1/N)*exp(-im*(2π/N)*k*n)
        end
        result[k+1]=A
    end
    return result
end

x = [-0.63 + 0.44im, 0.14 - 0.85im, 0.32 - 1.15im, 0.5 + 1.19im, -0.73 + 0.24im, 0.53 - 0.36im, -0.36 + 0.28im, 1.53 - 1.16im, -0.91 + 0.46im, 0.58 + 1.14im, -0.22 - 0.4im, -0.59 - 0.68im, 0.19 + 0.3im, -0.54 - 0.01im, 0.01 + 0.6im, 0.28 - 0.38im, 0.42 + 1.48im, 0.94 + 1.3im, 1.68 + 0.4im, 0.49 + 0.35im, 0.44 - 0.25im, 0.03 + 1.1im, -0.45 + 0.76im, 0.44 + 0.2im, -1.0 + 0.51im, 0.57 - 0.53im, 1.03 + 0.33im, 0.02 + 0.86im, -0.3 - 0.92im, 0.29 + 0.77im, -1.09 + 0.17im, -0.71 + 0.15im, -0.47 - 0.41im, 1.04 - 0.39im, 0.08 + 0.35im, -0.92 + 0.8im, -0.78 - 0.08im, 0.8 - 0.1im, -0.23 - 0.38im, -0.2 + 0.77im, -0.33 - 0.16im, -0.53 - 0.95im, 0.88 + 0.71im, -0.82 + 0.69im]

@btime(dft(x))
