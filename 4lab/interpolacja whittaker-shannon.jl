using CairoMakie
include("pila.jl")
function interpolate(t::Real; m::AbstractVector, s::AbstractVector, kernel::Function=sinc)::Real
    result = 0.0
    Δt = m[2] - m[1]

    for i in 1:lastindex(m)
        result += s[i] * kernel((t - m[i]) / Δt) #wzor whittakera-shanona
    end

    return result
end

function interpolate2(t::AbstractVector; m::AbstractVector, s::AbstractVector, kernel::Function=sinc)::Real
    result = 0.0
    Δt = m[2] - m[1]

    for i in 1:lastindex(m)
        return s[i] * kernel((t[i] - m[i]) / Δt)
    end
end

t = 2.0
m = LinRange(0,5,100)
s = pila.cw_rectangular(m)

a=LinRange(0.0,5.0,1000)

result = interpolate(t, m=m, s=s)
drugi = interpolate.(a, m=m, s=s)

scatter(m, s, color=:blue, markersize=5, label="Węzły interpolacyjne")
scatter!([t], [result], color=:red, markersize=10, label="Interpolacja dla t=$t")
lines!(a, drugi, color=:green, label="Interpolacja dla całego przedziału")

current_figure()
