function newton(n)
    ϵ=0.0001
    maxi = 100
    roznica =1
    a=n/2
    b=2
    while maxi > 0
    roznica=abs(a-b)
    if roznica < ϵ
        return a
    else
        a=(a+b)/2
        b=n/a
        maxi-=1
    end
    end
end

println("pierwiastkiem liczby jest: ", newton(81))
