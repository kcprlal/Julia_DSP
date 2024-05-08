using OffsetArrays
function dft(x::AbstractVector)::Vector
    N = length(x)
    ζ = OffsetArray(
        [cispi(-2 * n / N) for n in 0:(N-1)],
        0:(N-1)
    )
    [
        sum((
            x[n+1] * ζ[(n*f)%N]
            for n in 0:(N-1)
        ))
        for f in 0:(N-1)
    ]
end
x = [26,40,7,30,39,38,13,42,15,36,32]
y = dft(x)