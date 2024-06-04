function rozwiazanie(;
    fp::Float64=360.44,
    t1::Float64=-2.7,
    N::Int=58,
)
    g = t -> sign(sin(2pi*t))
    t = t = range(; start=t1, step=(1 / fp), length=N)
    y = 1.5 * g.(2.8 .* t .- 4.1)
    energy = sum(abs2, y)
    return energy
    130.5
end
rozwiazanie()