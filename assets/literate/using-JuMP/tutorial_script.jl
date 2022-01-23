# This file was generated, do not modify it.

using Pkg #hideall
Pkg.activate("_literate/using-JuMP/Project.toml")
Pkg.instantiate()
macro OUTPUT()
    return isdefined(Main, :Franklin) ? Franklin.OUT_PATH[] : "/tmp/"
end;

# set up objective function parameters and variables
pa = 100
pb = 75
a = range(0, 8, step=0.25)
b = range(0, 8, step=0.25)

# define objective function
f(a, b) = pa * a + pb * b

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

using JuMP
using Clp

factory_model = Model(Clp.Optimizer)

@variable(factory_model, x >= 0)

@variable(factory_model, y >= 0)

all_variables(factory_model)

@constraint(factory_model, time, 6x + 12y <= 80) # specify the time constraint

@constraint(factory_model, materials, 40x + 20y <= 300) # materials constraint

@objective(factory_model, Max, 100x + 75y)

print(factory_model)

latex_formulation(factory_model)

optimize!(factory_model)

value.(x)

value.(y)

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

value.(time)

value.(materials)

objective_value(factory_model)

@expression(factory_model, total_widgets, x+y)

value.(total_widgets)

has_duals(factory_model)

shadow_price(time)

shadow_price(materials)

reduced_cost(x)

reduced_cost(y)

