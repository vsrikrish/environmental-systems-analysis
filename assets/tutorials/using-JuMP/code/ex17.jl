# This file was generated, do not modify it. # hide
# replot the previous plot
contour(a,b,(a,b)->f(a,b),nlevels=15, c=:heat, linewidth=10, colorbar = false, contour_labels = true) # objective function contours
title!("Factory Optimization Problem") # add title
xaxis!("x=Widget A", lims=(0, maximum(a))) # add x-axis title and limits
yaxis!("y=Widget B", lims=(0, maximum(b))) # add y-axis title and limits
xticks!(0:maximum(a)) # set x-axis ticks
yticks!(0:maximum(b)) # set y-axis ticks
areaplot!(a, (300 .- 40*a)./20, legend=false, opacity=0.3) # plot materials constraint feasible region
areaplot!(a, (80 .- 6*a)./12, legend=false, opacity=0.3) # plot time constraint feasible region

# now we plot the solution that we obtained
scatter!([value.(x)],[value.(y)], markercolor="blue")
savefig(joinpath(@OUTPUT, "lp-sol-visualize.png")) # hide