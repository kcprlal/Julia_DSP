function conv(x,h)
    m=length(x)
    n=length(h)
    y=zeros(m+n-j)
    for i in 1:m
        for j in 1:n
            y[n+m-1]+=x[i].*h[j]
        end
    end
    return y   
end

function fun(r)
    p=[1.0+0im]
    for root in r
        p=conv(p,[1,-root])
    end
    return p
end

function ltia(b,a,f)
    M=length(b)
    licz=sum(b[m+1]*exp(-2im*pi*f*m) for m in 0:M-1)
    M=length(a)
    mian=sum(a[m+1]*exp(-2im*pi*f*m) for m in 0:M-1)
    return abs(licz/mian)
end
function rozwiazanie(;
    zz::Vector{ComplexF64} = ComplexF64[-1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    pp::Vector{ComplexF64} = ComplexF64[0.7284571130521847 + 0.513812573533834im, 0.7284571130521847 - 0.513812573533834im, 0.7757157470482499 + 0.0im],
    k::Float64 = 0.009468689614767533,
    F::Vector{Float64} = [0.04, 0.14, 0.39],
)
    a=fun(pp)
    b=fun(zz).*k
    amp=[ltia(b,a,f) for f in F]
    return sum(amp)/length(amp)
end
rozwiazanie()
