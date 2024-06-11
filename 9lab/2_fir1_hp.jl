kronecker(n::Integer)::Real = n == 0 ? (return 1) : (return 0)

function firwin_hp_I(order, F0)
    result=zeros(ComplexF64,order)
    for n in -order/2:oreder/2
        result[n] = kronecker(Int(n))-2*F0*sinc(2*F0*n)
    end
    return result
end