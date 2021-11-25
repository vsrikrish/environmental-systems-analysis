using Pkg #hideall
Pkg.activate("_literate/julia-plots/Project.toml")
Pkg.instantiate()
macro OUTPUT()
    return isdefined(Main, :Franklin) ? Franklin.OUT_PATH[] : "/tmp/"
end;

md"""
## Overview

This tutorial will give some examples of plotting and plotting features in Julia, as well as providing references to some relevant resources. The main plotting library is `Plots.jl`, but there are some others that provide useful features.

## Some Resources

* `Plots.jl` [useful tips](https://docs.juliaplots.org/latest/basics/#Useful-Tips)
* `Plots.jl` [examples](https://docs.juliaplots.org/latest/generated/gr/)
* [Plot attributes](http://docs.juliaplots.org/latest/generated/attributes_plot/)
* [Axis attributes](http://docs.juliaplots.org/latest/generated/attributes_axis/#Axis)
* [Color names](http://juliagraphics.github.io/Colors.jl/stable/namedcolors/)
"""

# ## Demos

using Plots
using Random # hide
Random.seed!(1) # hide

# ### Line Plots
# To generate a basic line plot, use `plot`.

y = rand(5)
plot(y, label="original data", legend=:topright)
savefig(joinpath(@OUTPUT, "line-plot.png")) # hide

# \fig{line-plot.png}

# There's a lot of customization here that can occur, a lot of which is discussed in the docs or can be found with some Googling.

# #### Adding Plot Elements
# 
# Now we can add some other lines and point markers. 

y2 = rand(5)
y3 = rand(5)
plot!(y2, label="new data")
scatter!(y3, label="even more data")
savefig(joinpath(@OUTPUT, "line-plot-added.png")) # hide

# \fig{line-plot-added.png}

# Remember that an exclamation mark (!) at the end of a function name means that function modifies an object in-place, so `plot!` and `scatter!` modify the current plotting object, they don't create a new plot.

# #### Removing Plot Elements
# 
# Sometimes we want to remove legends, axes, grid lines, and ticks.

plot!(legend=false, axis=false, grid=false, ticks=false)
savefig(joinpath(@OUTPUT, "line-plot-removed.png")) #hide

# \fig{line-plot-removed.png}

# #### Aspect Ratio
# 
# If we want to have a square aspect ratio, use `ratio = 1`.

v = rand(5)
plot(v, ratio=1, legend=false)
scatter!(v)
savefig(joinpath(@OUTPUT, "square-aspect.png")) #hide

# \fig{square-aspect.png}

# ### Heatmaps
 
# A heatmap is effectively a plotted matrix with colors chosen according to the values. Use `clim` to specify a fixed range for the color limits.

A = rand(10, 10)
heatmap(A, clim=(0, 1), ratio=1, legend=false, axis=false, ticks=false)
savefig(joinpath(@OUTPUT, "heatmap-basic.png")) #hide

# \fig{heatmap-basic.png}

M = [ 0 1 0; 0 0 0; 1 0 0]
whiteblack = [RGBA(1,1,1,0), RGB(0,0,0)]
heatmap(c=whiteblack, M, aspect_ratio = 1, ticks=.5:3.5, lims=(.5,3.5), gridalpha=1, legend=false, axis=false, ylabel="i", xlabel="j")
savefig(joinpath(@OUTPUT, "heatmap-bw.png")) #hide

# \fig{heatmap-bw.png}

# #### Custom Colors

using Colors

mycolors = [colorant"lightslateblue",colorant"limegreen",colorant"red"]
A = [i for i=50:300, j=1:100]
heatmap(A, c=mycolors, clim=(1,300))
savefig(joinpath(@OUTPUT, "heatmap-colors.png")) #hide

# \fig{heatmap-colors.png}

# ### Plotting Areas Under Curves

y = rand(10)
plot(y, fillrange= y.*0 .+ .5, label= "above/below 1/2", legend =:top)
savefig(joinpath(@OUTPUT, "above-below.png")) #hide

# \fig{above-below.png}

x = LinRange(0,2,100)
y1 = exp.(x)
y2 = exp.(1.3 .* x)
plot(x, y1, fillrange = y2, fillalpha = 0.35, c = 1, label = "Confidence band", legend = :topleft)
savefig(joinpath(@OUTPUT, "confidence.png")) #hide

# \fig{confidence.png}

x = -3:.01:3
areaplot(x, exp.(-x.^2/2)/√(2π),alpha=.25,legend=false)
savefig(joinpath(@OUTPUT, "normal-area.png")) #hide

# \fig{normal-area.png}

M = [1 2 3; 7 8 9; 4 5 6; 0 .5 1.5]
areaplot(1:3, M, seriescolor = [:red :green :blue ], fillalpha = [0.2 0.3 0.4])
savefig(joinpath(@OUTPUT, "area-colored.png")) #hide

# \fig{area-colored.png}

using SpecialFunctions
f = x->exp(-x^2/2)/√(2π)
δ = .01
plot()
x = √2 .* erfinv.(2 .*(δ/2 : δ : 1) .- 1)
areaplot(x, f.(x), seriescolor=[ :red,:blue], legend=false)
plot!(x, f.(x),c=:black)
savefig(joinpath(@OUTPUT, "normal-quantiles.png")) #hide

# \fig{normal-quantiles.png}

# ### Plotting Shapes

rectangle(w, h, x, y) = Shape(x .+ [0,w,w,0], y .+ [0,0,h,h])
circle(r,x,y) = (θ = LinRange(0,2π,500); (x.+r.*cos.(θ), y.+r.*sin.(θ)))
plot(circle(5,0,0), ratio=1, c=:red, fill=true)
plot!(rectangle(5*√2,5*√2,-2.5*√2,-2.5*√2),c=:white,fill=true,legend=false)
savefig(joinpath(@OUTPUT, "circle-rect.png")) #hide

# \fig{circle-rect.png}

# ### Editing Plots Manually

pl = plot(1:4,[1, 4, 9, 16])
savefig(joinpath(@OUTPUT, "basic-plot.png")) #hide

# \fig{basic-plot.png}

pl.attr
#-
pl.series_list[1]
#-
pl[:size]=(300,200)
#-
pl
savefig(joinpath(@OUTPUT, "basic-size.png")) #hide

# \fig{basic-size.png}

# ### Log-Scaled Axes

xx = .1:.1:10
plot(xx.^2, xaxis=:log, yaxis=:log)
savefig(joinpath(@OUTPUT, "log-axes.png")) #hide

# \fig{log-axes.png}

plot(exp.(x), yaxis=:log)
savefig(joinpath(@OUTPUT, "log-exp.png")) #hide

# \fig{log-exp.png}
