# This file was generated, do not modify it. # hide
using Distributions, StatsPlots
plot(Normal(2, 5))
savefig(joinpath(@OUTPUT, "normal-pdf.png")) # hide