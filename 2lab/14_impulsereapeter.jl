using CairoMakie
include("CPS.jl")
impuse_repeater(g::Function, t1::Real, t2::Real)::Function = fun -> g(mod(fun - t1, t2 - t1) + t1)

nowafunk = impuse_repeater(CPS.pulse_wave, 0, 2)
nowafunk(1.7)