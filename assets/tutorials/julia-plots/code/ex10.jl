# This file was generated, do not modify it. # hide
y = rand(10)
plot(y, fillrange= y.*0 .+ .5, label= "above/below 1/2", legend =:top)
savefig(joinpath(@OUTPUT, "above-below.png")) # hide