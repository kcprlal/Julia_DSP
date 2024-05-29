rfftfreq(N::Integer, fs::Real)::Vector = [n * (fs / N) for n in 0:(N-1)/2]
rfftfreq(6, 12.0)