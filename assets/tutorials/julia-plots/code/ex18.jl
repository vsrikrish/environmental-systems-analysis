# This file was generated, do not modify it. # hide
using DataFrames
dat = DataFrame(a = 1:10, b = 10 .+ rand(10), c = 10 .* rand(10))
@df dat density([:b :c], color=[:black :red])
savefig(joinpath(@OUTPUT, "dataframe-dist.png")) # hide