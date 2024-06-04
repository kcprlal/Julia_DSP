function rozwiazanie(;
    fp::Float64 = 210.32,
    t1::Float64 = -9.92,
    N::Int = 645,
)
    g(t)=sign.(sin.(2pi*t))
    t=LinRange(t1,t1+(N-1)/fp,N)
    y=g(0.1*t.-1.9)
    return sum(y)/length(y)
end
rozwiazanie()