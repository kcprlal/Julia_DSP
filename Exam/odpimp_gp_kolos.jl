hpf(order, f0) = [kronecker(n)-2*f0*sinc(2*f0*n) for n in -order/2 : order/2]
kronecker(n)= n==0 ? (return 1.0) : (return 0.0)
trojkat(M)=[1-abs(n)/(M+1) for n in -M:M]
function rozwiazanie(;
    order::Int = 72,
    fp::Float64 = 197.0,
    f0::Float64 = 29.55,
    z::Vector{Int} = [44, 43, 72, 69, 19, 59],
)
    h=hpf(order, f0/fp)
    h=h.*trojkat(Int(order/2))
    h_z=[h[i] for i in z]
    return sum(h_z)
end
rozwiazanie()