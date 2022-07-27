# This file was generated, do not modify it.

using Pkg #hideall
Pkg.activate("_literate/julia-plots/Project.toml")
Pkg.instantiate()
macro OUTPUT()
    return isdefined(Main, :Franklin) ? Franklin.OUT_PATH[] : "/tmp/"
end;

using Plots
using Random # hide
Random.seed!(1) # hide

y = rand(5)
plot(y, label="original data", legend=:topright)
savefig(joinpath(@OUTPUT, "line-plot.png")) # hide

y2 = rand(5)
y3 = rand(5)
plot!(y2, label="new data")
scatter!(y3, label="even more data")
savefig(joinpath(@OUTPUT, "line-plot-added.png")) # hide

plot!(legend=false, axis=false, grid=false, ticks=false)
savefig(joinpath(@OUTPUT, "line-plot-removed.png")) #hide

v = rand(5)
plot(v, ratio=1, legend=false)
scatter!(v)
savefig(joinpath(@OUTPUT, "square-aspect.png")) #hide

A = rand(10, 10)
heatmap(A, clim=(0, 1), ratio=1, legend=false, axis=false, ticks=false)
savefig(joinpath(@OUTPUT, "heatmap-basic.png")) #hide

M = [ 0 1 0; 0 0 0; 1 0 0]
whiteblack = [RGBA(1,1,1,0), RGB(0,0,0)]
heatmap(c=whiteblack, M, aspect_ratio = 1, ticks=.5:3.5, lims=(.5,3.5), gridalpha=1, legend=false, axis=false, ylabel="i", xlabel="j")
savefig(joinpath(@OUTPUT, "heatmap-bw.png")) #hide

using Colors

mycolors = [colorant"lightslateblue",colorant"limegreen",colorant"red"]
A = [i for i=50:300, j=1:100]
heatmap(A, c=mycolors, clim=(1,300))
savefig(joinpath(@OUTPUT, "heatmap-colors.png")) #hide

y = rand(10)
plot(y, fillrange= y.*0 .+ .5, label= "above/below 1/2", legend =:top)
savefig(joinpath(@OUTPUT, "above-below.png")) #hide

x = LinRange(0,2,100)
y1 = exp.(x)
y2 = exp.(1.3 .* x)
plot(x, y1, fillrange = y2, fillalpha = 0.35, c = 1, label = "Confidence band", legend = :topleft)
savefig(joinpath(@OUTPUT, "confidence.png")) #hide

x = -3:.01:3
areaplot(x, exp.(-x.^2/2)/√(2π),alpha=.25,legend=false)
savefig(joinpath(@OUTPUT, "normal-area.png")) #hide

M = [1 2 3; 7 8 9; 4 5 6; 0 .5 1.5]
areaplot(1:3, M, seriescolor = [:red :green :blue ], fillalpha = [0.2 0.3 0.4])
savefig(joinpath(@OUTPUT, "area-colored.png")) #hide

using SpecialFunctions
f = x->exp(-x^2/2)/√(2π)
δ = .01
plot()
x = √2 .* erfinv.(2 .*(δ/2 : δ : 1) .- 1)
areaplot(x, f.(x), seriescolor=[ :red,:blue], legend=false)
plot!(x, f.(x),c=:black)
savefig(joinpath(@OUTPUT, "normal-quantiles.png")) #hide

rectangle(w, h, x, y) = Shape(x .+ [0,w,w,0], y .+ [0,0,h,h])
circle(r,x,y) = (θ = LinRange(0,2π,500); (x.+r.*cos.(θ), y.+r.*sin.(θ)))
plot(circle(5,0,0), ratio=1, c=:red, fill=true)
plot!(rectangle(5*√2,5*√2,-2.5*√2,-2.5*√2),c=:white,fill=true,legend=false)
savefig(joinpath(@OUTPUT, "circle-rect.png")) #hide

using Distributions, StatsPlots
plot(Normal(2, 5))
savefig(joinpath(@OUTPUT, "normal-pdf.png")) # hide

scatter(LogNormal(0.8, 1.5))
savefig(joinpath(@OUTPUT, "lognormal-scatter.png")) # hide

using DataFrames
dat = DataFrame(a = 1:10, b = 10 .+ rand(10), c = 10 .* rand(10))
@df dat density([:b :c], color=[:black :red])
savefig(joinpath(@OUTPUT, "dataframe-dist.png")) #hide

pl = plot(1:4,[1, 4, 9, 16])
savefig(joinpath(@OUTPUT, "basic-plot.png")) #hide

pl.attr

pl.series_list[1]

pl[:size]=(300,200)

pl
savefig(joinpath(@OUTPUT, "basic-size.png")) #hide

xx = .1:.1:10
plot(xx.^2, xaxis=:log, yaxis=:log)
savefig(joinpath(@OUTPUT, "log-axes.png")) #hide

plot(exp.(x), yaxis=:log)
savefig(joinpath(@OUTPUT, "log-exp.png")) #hide

