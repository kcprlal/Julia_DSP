function rozwiazanie(;
    m::Vector{Float64} = [2.9, 2.9074, 2.9148, 2.9222, 2.9296, 2.937, 2.9444, 2.9518, 2.9592, 2.9666, 2.974, 2.9814, 2.9888, 2.9962, 3.0036, 3.011, 3.0184, 3.0258, 3.0332, 3.0406, 3.048, 3.0554, 3.0628, 3.0702, 3.0776, 3.085, 3.0924, 3.0998, 3.1072, 3.1146, 3.122, 3.1294, 3.1368, 3.1442, 3.1516, 3.159, 3.1664, 3.1738, 3.1812, 3.1886, 3.196, 3.2034, 3.2108, 3.2182, 3.2256, 3.233, 3.2404, 3.2478, 3.2552, 3.2626, 3.27, 3.2774, 3.2848, 3.2922],
    s::Vector{Float64} = [0.8219, 0.3712, 0.6418, 0.6943, 0.8291, 0.5003, 0.9838, 0.3545, 0.2335, 0.2895, 0.3844, 0.923, 0.661, 0.7629, 0.79, 0.3124, 0.9891, 0.9669, 0.2928, 0.2389, 0.601, 0.7669, 0.3682, 0.4618, 0.727, 0.456, 0.0223, 0.4677, 0.0713, 0.495, 0.7083, 0.4929, 0.621, 0.7356, 0.6019, 0.9994, 0.7741, 0.7389, 0.8492, 0.9443, 0.8405, 0.5069, 0.4942, 0.3919, 0.0969, 0.002, 0.7924, 0.3882, 0.9124, 0.3141, 0.1961, 0.6, 0.3078, 0.6057],
    t::Vector{Float64} = [2.91554, 3.00286, 2.92072, 2.94588, 3.16566, 3.03468, 2.9148, 3.09758, 2.90518, 3.1849, 2.98584],
)
function interp(m,s,ker::Function=sinc)
    return fun -> begin
        res=0.0
        dm=m[2]-m[1]
        for i in eachindex(m)
            res+=s[i]*ker((fun-m[i])/dm)
        end
        return res
    end 
    end
    g=interp(m,s)
    result=sum(g.(t))
    return result
end
rozwiazanie()