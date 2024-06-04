function rozwiazanie(;
    order::Int = 96,
    fp::Float64 = 191.0,
    f1::Float64 = 10.5,
    f2::Float64 = 20.06,
    z::Vector{Int} = [92, 41, 40, 59, 25, 90],
)
    n= -order/2:1:(order/2-1)
    
    h1 = @.sin(2*pi*f1/fp*n)./(pi*n)
    for i in 1:order
        if n[i]==0
            h1[i]=2*f1/fp
        end
    end

    h2 = @.sin(2*pi*f2/fp*n)/(pi*n)
    for i in 1:order
        if n[i]==0
            h2[i]=2*f2/fp
        end
    end

    hpp=h2.-h1

    hamming(N::Integer)::AbstractVector{<:Real} = 0.54 .+ 0.46 .*cos.(2π * LinRange(0,N,N) ./ (2*N+1))
    w=hamming(order)
    hh=hpp.*w
    return sum(hh[z])
end
rozwiazanie()
-0.04788117950915512