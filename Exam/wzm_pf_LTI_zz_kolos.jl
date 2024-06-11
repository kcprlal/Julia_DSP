function conv(f::AbstractVector, g::AbstractVector)::Vector
    n, m = length(f), length(g)
    y = zeros(eltype(f), n + m - 1)
    for i in 1:n
        for j in 1:m
            y[i + j - 1] += f[i] * g[j]
        end
    end
    return y
end

function poly_from_roots(r::AbstractVector)
    p = [1.0 + 0im]
    for root in r
        p = conv(p, [1, -root])
    end
    return p
end

function lti_response(f::Real, b::Vector, a::Vector)::ComplexF64
    M, K = length(b), length(a)
    num = sum(b[m + 1] * cispi(-2 * f * m) for m in 0:M-1)
    denom = sum(a[k + 1] * cispi(-2 * f * k) for k in 0:K-1)
    return abs(num / denom)
    #return angle(num/denom)
end

function rozwiazanie(;
    zz::Vector{ComplexF64} = ComplexF64[0.9802672225709579 + 0.19767693935565772im, 0.9802672225709579 - 0.19767693935565772im, 0.9802672225709579 + 0.19767693935565772im, 0.9802672225709579 - 0.19767693935565772im, 0.9802672225709579 + 0.19767693935565772im, 0.9802672225709579 - 0.19767693935565772im, 0.9802672225709579 + 0.19767693935565772im, 0.9802672225709579 - 0.19767693935565772im, 0.9802672225709579 + 0.19767693935565772im, 0.9802672225709579 - 0.19767693935565772im, 0.9802672225709579 + 0.19767693935565772im, 0.9802672225709579 - 0.19767693935565772im],
    pp::Vector{ComplexF64} = ComplexF64[0.9442281198708459 - 0.3090372004218855im, 0.9896499366378279 + 0.12410065602869866im, 0.9442281198708459 + 0.3090372004218855im, 0.9896499366378279 - 0.12410065602869866im, 0.9037434175350425 - 0.3418524187314371im, 0.9838373473782489 + 0.10659932094806561im, 0.9037434175350425 + 0.3418524187314371im, 0.9838373473782489 - 0.10659932094806561im, 0.6394685617123222 - 0.3966626143337363im, 0.9689142251636584 + 0.05336863806398787im, 0.6394685617123222 + 0.3966626143337363im, 0.9689142251636584 - 0.05336863806398787im],
    k::Float64 = 0.5166501798435038,
    F::Vector{Float64} = [0.18, 0.35, 0.36],
)
    a = poly_from_roots(pp)
    b = poly_from_roots(zz) .* k
    ϕ = [lti_amp(f, b, a) for f in F]
    return sum(ϕ) / length(ϕ)
end

println(rozwiazanie())
