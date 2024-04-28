using CairoMakie
function kronecker(n::AbstractVector)
    result = similar(n)
    for (i, val) in enumerate(n)
        result[i] = val == 0 ? 1.0 : 0.0
    end
    return result
end

n=LinRange(-2,2,1005)
lines(n,kronecker(n))
