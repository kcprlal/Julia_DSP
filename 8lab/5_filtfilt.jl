    function lti_filter(b::Vector, a::Vector, x::Vector)::Vector
        N = length(x)
        M = length(b) - 1
        K = length(a) - 1
        y = zeros(Float64, N)
    
        for n in 1:N
            for m in 0:M
                if n - m > 0
                    y[n] += b[m+1] * x[n-m]
                end
            end
            for k in 1:K
                if n - k > 0
                    y[n] -= a[k+1] * y[n-k]
                end
            end
        end
        return y
    end
    
    function filtfilt(b::Vector{Float64} = [3.123897691708271e-5, 0.0, -0.00012495590766833085, 0.0, 0.00018743386150249627, 0.0, -0.00012495590766833085, 0.0, 3.123897691708271e-5],
        a::Vector{Float64} = [1.0, -7.163116152392713, 22.847955120664427, -42.35191331364551, 49.8791443071093, -38.21469467622461, 18.602407489286445, -5.262663203418714, 0.6630104843858914],
        x::Vector{Float64} = [0.7, 0.49, -0.37, 0.28, -0.11, 0.65, 0.83, 0.54, -0.1, 0.44, 0.68, 0.64, 0.86, 0.8, 0.33, 0.61, 0.78, 0.8, 0.05, -0.14, -0.91, 0.36, 0.08, -0.03, -0.05, 0.24, -0.61, -0.97, 0.96, 0.75, 0.93, 0.26, -0.77, 0.37],
        )::Vector
        y_fwd = lti_filter(b, a, x)
        y_r = reverse(y_fwd)
        y_b = lti_filter(b, a, y_r)
        y = reverse(y_b)
    return y
    end
    filtfilt()