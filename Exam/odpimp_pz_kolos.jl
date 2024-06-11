blackman(M::Integer)::AbstractVector{<:Real} = [0.42 + 0.5cos(2π * n / (2M + 1)) + 0.08cos(4π * n / (2M + 1)) for n = -M:M]
kronecker(n) = n==0 ? (return 1.0) : (return 0.0)
hp(order, f1,f2)=[kronecker(n) - (2*f2*sinc(2*f2*n)-2*f1*sinc(2*f1*n)) for n in -order/2 : order/2]
function rozwiazanie(;
    order::Int = 68,
    fp::Float64 = 172.0,
    f1::Float64 = 51.6,
    f2::Float64 = 84.28,
    z::Vector{Int} = [14, 11, 56, 42, 17, 25],
)
    h = hp(order, f1/fp,f2/fp)
    h = h.* blackman(Int(order/2))
    h_z = [h[i] for i in z]
    return sum(h_z)
end
rozwiazanie()