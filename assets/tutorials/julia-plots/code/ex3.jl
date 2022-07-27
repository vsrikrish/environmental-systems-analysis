# This file was generated, do not modify it. # hide
y = rand(5)
plot(y, label="original data", legend=:topright)
savefig(joinpath(@OUTPUT, "line-plot.png")) # hide