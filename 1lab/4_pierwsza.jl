function pierwsza(n)
    for i in 2:n-1    
        if(n%i==0) return false
        else return true
        end
    end
end
print(pierwsza(14))
        