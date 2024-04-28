include("pila.jl")
using CairoMakie
function interpolate(t::Real; m::AbstractVector, s::AbstractVector, kernel::Function=sinc)::Function
    # Obliczenie długości wektora m
    N = length(m)
    
    # Funkcja anonimowa interpolująca
    f(t) = begin
        # Znalezienie indeksu przedziału, do którego należy t
        idx = searchsortedlast(m, t) 
        # Obliczenie wartości interpolowanej na podstawie funkcji sklejanej
        t1, t2 = m[idx], m[idx+1]
        s1, s2 = s[idx], s[idx+1]
        delta_t = t2 - t1
        t_relative = (t - t1) / delta_t
        result = s1 * kernel(1 - t_relative) + s2 * kernel(t_relative)
        
        return result
    end
    
    return f
end
t=2.0
m=LinRange(0,5,100)
s=pila.cw_rectangular(m)
res=interpolate(t,m=m,s=s)
scatter(t,res,color=:red)
line!(m,s,color=:green)
current_figure()