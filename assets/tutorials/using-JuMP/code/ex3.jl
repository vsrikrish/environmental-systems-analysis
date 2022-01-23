# This file was generated, do not modify it. # hide
# start plotting
using Plots
plotlyjs() # hide

contour(a,b,(a,b)->f(a,b),nlevels=15, c=:heat, linewidth=10, colorbar = false, contour_labels = true) # objective function contours
title!("Factory Optimization Problem") # add title
xaxis!("x=Widget A", lims=(0, maximum(a))) # add x-axis title and limits
yaxis!("y=Widget B", lims=(0, maximum(b))) # add y-axis title and limits
xticks!(0:maximum(a)) # set x-axis ticks
yticks!(0:maximum(b)) # set y-axis ticks
areaplot!(a[a.<=11], (300 .- 40*a)./20, legend=false, opacity=0.3) # plot materials constraint feasible region
areaplot!(a[a.<=8], (80 .- 6*a)./12, legend=false, opacity=0.3) # plot time constraint feasible region
savefig(joinpath(@OUTPUT, "lp-visualize.png")) # hide