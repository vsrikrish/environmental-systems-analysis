# This file was generated, do not modify it. # hide
M = [1 2 3; 7 8 9; 4 5 6; 0 .5 1.5]
areaplot(1:3, M, seriescolor = [:red :green :blue ], fillalpha = [0.2 0.3 0.4])
savefig(joinpath(@OUTPUT, "area-colored.png")) # hide