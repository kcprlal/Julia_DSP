function lti_filter(b::Vector, a::Vector, x::Vector)::Vector
    N = length(x)
    M = length(b) - 1
    K = length(a) - 1
    y = zeros(Float64, N)

    for n in 1:N
        for m in 0:M
            if n - m > 0
                y[n] += b[m+1] * x[n-m]
            end
        end
        for k in 1:K
            if n - k > 0
                y[n] -= a[k+1] * y[n-k]
            end
        end
    end
    return y
end
function rozwiazanie(;
    b::Vector{Float64} = [0.023540040013468957, 0.024595445170023402, 0.024595445170023402, 0.023540040013468957],
    a::Vector{Float64} = [1.0, -2.1693876887789485, 1.906383098398375, -0.6407244392524417],
    x::Vector{Float64} = [0.92, 0.6, -0.44, 0.24, -0.35, -0.94, -0.56, 0.29, -0.66, 0.7, -0.82, 0.97, 0.26, -0.35, -0.41, -0.99, 0.87, -0.38, 0.77, 0.65, 0.32, 0.32, 0.6, -0.86, 0.92, -0.91, -0.46, -0.73, 0.39, -0.11, 0.95, -0.15, -0.85, -0.34, 0.14, 0.71, 0.79, -0.9, 0.47, -0.56],
    L::Int = 51,
)
    N = length(x)
    x_padded = vcat(x, zeros(Float64, L - N))
    y = lti_filter(b, a, x_padded)

    return sum(y.^2)

end
rozwiazanie()