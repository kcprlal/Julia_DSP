kronecker(n::Integer)::Real = n == 0 ? (return 1) : (return 0)

function firwin_bs_I(order, F1, F2)
    result=zeros(ComplexF64,order)
    for n in -order/2:order/2
        result[n] = kronecker(Int(n))-(2*F2*sinc(2*F2*n)-2*F1*sinc(2*F1*n))
    end
    return result
end