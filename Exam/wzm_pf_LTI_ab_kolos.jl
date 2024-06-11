function lti_response(f::Real, b::Vector{Float64}, a::Vector{Float64})
    M = length(b)
    K = length(a)
    num = sum(b[m+1] * exp(-2im*pi * f * m) for m in 0:M-1)
    denom = sum(a[k+1] * exp(-2im *pi * f * k) for k in 0:K-1)
    return abs(num / denom)
    #return angle(num / denom)
end

function rozwiazanie(;
    b::Vector{Float64} = [0.004865870317487714, -0.01131185631260567, 0.015014537445199013, -0.011311856312605666, 0.00486587031748771],
    a::Vector{Float64} = [1.0, -3.4096394828856473, 4.39739536823865, -2.538701080066547, 0.5530677601685071],
    F::Vector{Float64} = [0.17, 0.27, 0.33],
)
    amplitudes = [lti_response(f, b, a) for f in F]
    return sum(amplitudes) / length(amplitudes)
end

println(rozwiazanie())
