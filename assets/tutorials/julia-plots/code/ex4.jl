# This file was generated, do not modify it. # hide
y2 = rand(5)
y3 = rand(5)
plot!(y2, label="new data")
scatter!(y3, label="even more data")
savefig(joinpath(@OUTPUT, "line-plot-added.png")) # hide