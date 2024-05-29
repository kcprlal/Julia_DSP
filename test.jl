fftfreq(N::Integer, fs::Real)::Vector = [(k < N÷2 ? k*(fs/N) : (k-N)*(fs/N)) for k in 0:(N-1)]
println(fftfreq(8, 12))

    
    
