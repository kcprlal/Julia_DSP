function running_power(x::AbstractVector, M::Integer)::Vector
    result::AbstractVector = zeros(length(x))
    for k in 1:length(x)
        n₁ = k - M < 1 ? 1 : k - M
        n₂ = k + M > lastindex(x) ? lastindex(x) : k + M
        result[k] = (1 / (n₂ - n₁ + 1)) * sum(abs2, x[n₁:n₂])
    end
    return result
end
x=[1+4im,2,3+7im,4,5]
a=running_power(x,3)