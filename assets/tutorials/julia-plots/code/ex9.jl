# This file was generated, do not modify it. # hide
using Colors

mycolors = [colorant"lightslateblue",colorant"limegreen",colorant"red"]
A = [i for i=50:300, j=1:100]
heatmap(A, c=mycolors, clim=(1,300))
savefig(joinpath(@OUTPUT, "heatmap-colors.png")) # hide