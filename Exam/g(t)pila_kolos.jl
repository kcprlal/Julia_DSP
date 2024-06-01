function rozwiazanie(;
    fp::Float64 = 439.38,
    t1::Float64 = -4.56,
    N::Int = 765,
)
    g(t) = -2*rem(t,1,RoundNearest)
    t=LinRange(t1,t1+(N-1)/fp,N)
    y=2.9*g.(3.3*t.-0.7)
    rms=sqrt(sum(y.^2)/N)
    return rms
    1.702231910297535
end
rozwiazanie()