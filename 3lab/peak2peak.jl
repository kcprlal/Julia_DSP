function peak2peak(x)
    return maximum(x)-minimum(x)
end
x=[1,2,3,4,5]
println(peak2peak(x))