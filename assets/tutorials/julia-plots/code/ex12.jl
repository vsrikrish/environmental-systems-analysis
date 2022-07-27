# This file was generated, do not modify it. # hide
x = -3:.01:3
areaplot(x, exp.(-x.^2/2)/√(2π),alpha=.25,legend=false)
savefig(joinpath(@OUTPUT, "normal-area.png")) # hide