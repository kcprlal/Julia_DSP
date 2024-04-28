function conv(x::AbstractVector, h::AbstractVector)

    vsize = length(h) + length(x) - 1
    y = zeros(1, vsize)
    newx = zeros(1, length(x) + 2 * (length(h) - 1))
    
    #uzupelnij wektor newx
    for i in 1:length(x)
        newx[i+length(h)-1] = x[i]
    end

    for m in 1:length(newx)
        
        y[m] = sum(newx.*newh)
    end
    return y
end

#program
x = [1, 1, 1]
h = [1, 2, 3]
wynik = conv(x, h)