using PackageCompiler, IJulia
using Flux, Plots, DifferentialEquations, JuMP, Zygote, BenchmarkTools, NCDataFrame, DataFrames

create_sysimage([:Flux,
                 :Plots,
                 :DifferentialEquations,
                 :JuMP,
                 :Zygote,
                 :BenchmarkTools,
                 :NCDataFrame,
                 :DataFrames
                ], sysimage_path="/home/xteca/zlib/sys_fpdj.so")

IJulia.installkernel("Julia FPDJ", "--sysimage=/home/xteca/zlib/sys_fpdj.so")
