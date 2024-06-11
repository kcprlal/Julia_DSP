using LinearAlgebra
function roots(a::AbstractVector{T}) where T
    n = length(a) - 1
    H = zeros(T, n, n)
    for i in 1:n-1
        H[i+1, i] = 1
    end
    H[1, :] = -reverse(a[2:end]) ./ a[1]

    return eigvals(H)
end

function rozwiazanie(;
    b::Vector{Float64} = [0.04187682823477176, 0.1256304847043153, 0.1256304847043153, 0.04187682823477176],
    a::Vector{Float64} = [0.10, -0.920297336835758, 0.045262493744089, -0.2188790478264995],
)
    p = roots(a)
    n = length(p)
    for i in 1:n
        if abs(p[i]) > 1
            return -1.0
        end
    end
    return 1.0
end

println(rozwiazanie())
