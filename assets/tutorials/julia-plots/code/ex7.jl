# This file was generated, do not modify it. # hide
A = rand(10, 10)
heatmap(A, clim=(0, 1), ratio=1, legend=false, axis=false, ticks=false)
savefig(joinpath(@OUTPUT, "heatmap-basic.png")) # hide