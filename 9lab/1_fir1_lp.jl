function firwin_lp_I(order, F0)
    result = zeros(ComplexF64, order + 1)
    for n in Int(-order / 2):Int(order / 2)
        result[n+Int(order / 2)+1] = 2 * F0 * sinc(2 * F0 * n)
    end
    return real(result)
end
firwin_lp_I(6,0.125)