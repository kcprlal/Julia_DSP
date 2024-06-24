function lti_response(f::Real, b::Vector{Float64}, a::Vector{Float64})
    M = length(b)
    K = length(a)
    num = sum(b[m+1] * exp(-2im*pi * f * m) for m in 0:M-1)
    denom = sum(a[k+1] * exp(-2im *pi * f * k) for k in 0:K-1)
    return abs(num / denom)
    #return angle(num / denom)
end

function rozwiazanie(;
    b::Vector{Float64} = [0.6417184090603817, -3.7616105436310394, 9.274815812865095, -12.309795323205034, 9.274815812865096, -3.761610543631039, 0.6417184090603816],
    a::Vector{Float64} = [1.0, -5.082113370640544, 10.788496035490024, -12.20121649678169, 7.705644429955619, -2.549686543044882, 0.3389279784053145],
    F::Vector{Float64} = [0.04, 0.04, 0.05, 0.13, 0.2, 0.21],
)
    amplitudes = [lti_response(f, b, a) for f in F]
    return sum(amplitudes) / length(amplitudes)
end

println(rozwiazanie())
