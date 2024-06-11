function rozwiazanie(;
    fp::Float64=232.6,
    t1::Float64=8.26,
    N::Int=129,
)
    g(t) = 4 * abs(t - floor(t+3/4)+1/4)-1
    t=LinRange(t1,t1+(N-1)/fp,N)
    y=2.9*g.(3.3*t.-0.7)
    rms=sqrt(sum(y.^2)/N)
    return rms
end
rozwiazanie()