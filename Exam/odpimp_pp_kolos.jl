firwin_bs_I(order::Integer, F1::Float64, F2::Float64)::Vector = [kronecker(Int(n)) - (2F2 * sinc(2F2 * n) - 2F1 * sinc(2F1 * n)) for n in -order/2:order/2]
kronecker(n::Integer)::Real = n == 0 ? (return 1) : (return 0)
hamming(M::Integer)::AbstractVector{<:Real} = [0.54 + 0.46cos(2π * n / (2M + 1)) for n = -M:M]
triang(M::Integer)::AbstractVector{<:Real} = [1 - abs(n) / (M + 1) for n = -M:M]
function rozwiazanie(;
    order::Int = 40,
    fp::Float64 = 148.0,
    f1::Float64 = 37.74,
    f2::Float64 = 68.82,
    z::Vector{Int} = [27, 21, 27, 19, 30],
)
    h = firwin_bs_I(order, f1 / fp, f2 / fp) # lp/hp/bp/bs
    h = h .* triang(Int(order / 2)) # triang/hamming/hanning/blackman
    h_z = [h[i] for i in z]
    return sum(h_z)
end
rozwiazanie()