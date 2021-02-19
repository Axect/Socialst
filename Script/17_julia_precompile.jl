using PackageCompiler, IJulia, BenchmarkTools
using Flux, Plots, DifferentialEquations, JuMP
using NCDataFrame, DataFrames, Distributions, QuadGK, LsqFit
using ForwardDiff, Zygote

create_sysimage([:Flux,
                 :Plots,
                 :DifferentialEquations,
                 :JuMP,
                 :Zygote,
                 :BenchmarkTools,
                 :NCDataFrame,
                 :DataFrames,
                 :Distributions,
                 :QuadGK,
                 :ForwardDiff,
                 :LsqFit
                ], sysimage_path="/home/xteca/zlib/sys_science.so")

IJulia.installkernel("Julia Science", "--sysimage=/home/xteca/zlib/sys_science.so")
