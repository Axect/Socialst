using PackageCompiler, IJulia, BenchmarkTools
using Flux, Plots, DifferentialEquations, JuMP
using NCDataFrame, DataFrames, Distributions, QuadGK, LsqFit
using ForwardDiff, Zygote
using LoopVectorization, Gadfly

zlib = joinpath(homedir(), "zlib/sys_science.so")

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
                 :LsqFit,
                 :LoopVectorization,
                 :Gadfly
                ], sysimage_path=zlib)

IJulia.installkernel("Julia Science", "--sysimage=$zlib")
