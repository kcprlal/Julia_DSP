function odwroc(slowo)
    odwrocone=""
    for i in lastindex(slowo):-1:1
        odwrocone*=slowo[i]
    end
    return odwrocone
end

print(odwroc("siema"))
