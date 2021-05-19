using PackageCompiler, IJulia, BenchmarkTools
using Flux, Plots, JuMP
using NCDataFrame, DataFrames, Distributions, QuadGK, LsqFit
using ForwardDiff, Zygote
using LoopVectorization, Gadfly
using GLM, MLDatasets, CUDA

zlib = joinpath(homedir(), "zlib/sys_ml.so")

create_sysimage([:Flux,
                 :Plots,
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
                 :Gadfly,
                 :GLM,
                 :MLDatasets,
                 :CUDA
                ], sysimage_path=zlib)

IJulia.installkernel("Julia ML", "--sysimage=$zlib")
