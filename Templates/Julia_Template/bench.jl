using BenchmarkTools, DataFrames, CSV, LoopVectorization

function target(x::S) where {T <: Number, S <: AbstractVector{T}}
    x
end

df = DataFrame(min=Float64[], mean=Float64[], max=Float64[], param=Int64[])

for p in 1:10
    x = Vector{Float64}(undef, 10^p)
    b = @benchmark target($x)
    push!(
        df, 
        Dict(
            :min    => minimum(b).time,
            :mean   => mean(b).time,
            :max    => maximum(b).time,
            :param  => 10^p
        )
    )
end

df[:, :min] ./= 10^9
df[:, :mean] ./= 10^9
df[:, :max] ./= 10^9

CSV.write("bench_julia.csv", df)
