function rozwiazanie(;
    z::Vector{ComplexF64} = ComplexF64[-1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[0.15882668707542302 + 0.6564623730651008im, 0.15882668707542302 - 0.6564623730651008im, 0.11471384877913365 + 0.19639323637015274im, 1.5131001347972541 - 2.590468680003009im],
    k::Float64 = 0.05851270857137604,
)
    P = length(p)
    mod = zeros(P)
    x = 0

    for i in 1:P
        mod[i] = abs(p[i])
    end

    if mod[P] < 1
        x = 1.0
    elseif mod[P] == 1.0
        x = 0.0
    else
        x = -1.0
    end
    return x
end
rozwiazanie()