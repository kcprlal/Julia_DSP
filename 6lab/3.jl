energy(x::AbstractVector)::Real = sum(abs2.(x))
x=[1,2.5,3+3im,4,5+5im]
a=energy(x)