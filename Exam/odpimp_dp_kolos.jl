hamming(M) = [0.54+0.46cos(2π*n/(2M+1)) for n in -M:M]
fdp(order, f0) = [2*f0*sinc(2*f0*n) for n in -order/2 : order/2]
function rozwiazanie(;
    order::Int = 24,
    fp::Float64 = 116.0,
    f0::Float64 = 11.6,
    z::Vector{Int} = [8, 8, 1, 22, 1, 1],
)
    h=fdp(order,f0/fp)
    h=h.*hamming(Int(order/2))
    hz=[h[i] for i in z]
    return sum(hz)
end
rozwiazanie()