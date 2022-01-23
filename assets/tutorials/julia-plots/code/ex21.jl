# This file was generated, do not modify it. # hide
xx = .1:.1:10
plot(xx.^2, xaxis=:log, yaxis=:log)
savefig(joinpath(@OUTPUT, "log-axes.png")) # hide