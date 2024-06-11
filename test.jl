function ltia(a,b,f)
    M=length(b)
    N=length(a)
    licznik=sum([b[m+1]*exp(-2im*f*pi*m) for m in 0:M-1])
    mian=sum(   )
    return abs(licznik/mian)
end

function rozwiazanie(;
    b::Vector{Float64} = [0.01790522907755109, 0.08952614538775544, 0.17905229077551088, 0.17905229077551088, 0.08952614538775544, 0.01790522907755109],
    a::Vector{Float64} = [1.0, -1.182869923850837, 1.124607313530783, -0.49193120719999484, 0.1380961947896992, -0.01493504678801563],
    F::Vector{Float64} = [0.02, 0.08, 0.09, 0.14, 0.29, 0.3],
)
    amplitudes = [ltia(a,b,f) for f in F]
    return sum(amplitudes)/length(amplitudes)
end
rozwiazanie()