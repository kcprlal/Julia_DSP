kronecker(n::Integer)::Real = n == 0 ? (return 1) : (return 0)

function firwin_hp_I(order, F0)
    result = zeros(ComplexF64, order)
    for n in -div(order,2):div(order,2)
        result[n+div(order,2)+1] = kronecker(Int(n)) - 2 * F0 * sinc(2 * F0 * n)
    end
    return real(result)
end
firwin_hp_I(7,0.25)