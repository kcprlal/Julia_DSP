using CairoMakie
probki=256
fp = 1000 #Hz, liczba probek na sekunde
amplituda = 2
fs = 25#Hz, cz oscylacji
ϕ = pi / 4#przesuniecie fazowe
dt = 1 / fp
t1=0.25
t = LinRange(t1, t1 + (probki - 1) / fp, probki)
x = amplituda * sin.(2 * pi * fs * t .+ ϕ)
scatter(t,x)
lines!(t,x)
current_figure()
