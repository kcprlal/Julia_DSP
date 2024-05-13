quantize(x::Real; L::AbstractVector)::Function = fun-> L[argmin(abs.(x.-L))]
