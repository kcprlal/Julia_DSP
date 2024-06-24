using LinearAlgebra
function roots(a)
    N=length(a)-2
    H=Matrix(I,N,N)
    Z=zeros(N)
    H=vcat(Z',H)
    H=hcat(H,-reverse(a[2:end]))
    return eigvals(H)
end

function rozwiazanie(;
    b::Vector{Float64} = [0.5823274294543418, -3.7138507401970093, 11.200996469055077, -20.54945549308701, 24.97408199476976, -20.54945549308701, 11.200996469055077, -3.7138507401970107, 0.5823274294543419],
    a::Vector{Float64} = [1.0, -5.673007755525163, 15.251846199606735, -25.073380612486048, 27.479189179667586, -20.54432369374372, 10.26776395053345, -3.157042650494075, 0.4647952818640819],
)
    p = roots(a)
    n = length(p)
    for i in 1:n
        if abs(p[i]) > 1
            return -1.0
        end
    end
    return 1.0
end

println(rozwiazanie())
