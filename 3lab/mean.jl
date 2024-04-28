function mean(x)
   return abs(sqrt(sum(x.^2)))
end
x=[1im,2,3im,4,5im]
println(mean(x))