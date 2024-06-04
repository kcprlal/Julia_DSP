using BenchmarkTools
function fft_custom(x::Vector{ComplexF64})::Vector{ComplexF64}
    N::Int = length(x)
    index::Int = 0
    N % 2 != 0 ? index = ((N - 1) / 2) + 1 : index = ((N - 1) / 2) + 1 + 0.5
    result = zeros(Complex{Float64}, N)
    twifac::AbstractVector = @.exp.(-2im * π * (0:N-1)/N) #mozna obliczyc w czasie kompilacji
 
    for k in 0:index-1
        A = 0.0 + 0.0im
        for n in 0:N-1
            A += x[n+1] * twifac[(k*n)%N+1]
        end
        result[k+1] = A / N
        if(k>0) result[N-k+1] = conj(A / N) end
    end
    return result
end

x = [121.0+0.0im, 23.0+0.0im, 43.0+0.0im, 21.0+0.0im, 43.0+0.0im]
@btime fft_custom(x)

