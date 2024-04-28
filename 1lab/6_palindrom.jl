function palindrom(slowo)
    n=lastindex(slowo)
    for i in 1:n ÷ 2-1
        if(slowo[i]!=slowo[n-i+1]) return false
        end
    end
    return true
end

print(palindrom("kajak"))