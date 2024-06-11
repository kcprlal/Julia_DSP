using BenchmarkTools
function fft_custom(x::Vector{ComplexF64})::Vector{ComplexF64}
    N::Int = length(x)
    result = zeros(Complex{Float64}, N)
    twifac::AbstractVector = @.exp(-2im * π * (0:N-1)/N) #mozna obliczyc w czasie kompilacji
 
    for k in 0:N-1
        A = 0.0 + 0.0im
        for n in 0:N-1
            A += x[n+1] * twifac[(k*n)%N+1]
        end
        result[k+1] = A / N
    end
    return result
end

x = [-0.63 + 0.44im, 0.14 - 0.85im, 0.32 - 1.15im, 0.5 + 1.19im]
    
@btime fft_custom(x)

