function rozwiazanie(;
    fp::Float64 = 448.57,
    t1::Float64 = -9.93,
    N::Int = 239,
)
    g(t) = 2/π*asin.(sin.(π*t))
    
    t=LinRange(t1,t1+(N-1)/fp,N)
    
    y=3.4.*g.(3.6.*t.-4.8)
    energy=sum(y.^2)
end
rozwiazanie()