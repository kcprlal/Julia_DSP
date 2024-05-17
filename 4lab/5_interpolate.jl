
function interpolate(t::Real; m::AbstractVector, s::AbstractVector, kernel::Function=sinc)::Function
    return newf -> begin
        result=0.0 
        Δt=m[2]-m[1]
        for n in eachindex(m)
            result+=s[n]*kernel((newf-m[n])/Δt)
        end       
        return result
    end
end
m = [0.0, 1.0, 2.0, 3.0, 4.0]
s = [1.0, 2.0, 0.0, 2.0, 1.0]
interpolator = interpolate(0.0; m=m, s=s)
result = interpolator(2.5)
println(result)