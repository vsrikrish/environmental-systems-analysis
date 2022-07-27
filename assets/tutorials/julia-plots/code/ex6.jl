# This file was generated, do not modify it. # hide
v = rand(5)
plot(v, ratio=1, legend=false)
scatter!(v)
savefig(joinpath(@OUTPUT, "square-aspect.png")) # hide