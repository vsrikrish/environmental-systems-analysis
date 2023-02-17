using Pkg #hideall
Pkg.activate("_literate/probability-stats/Project.toml")
Pkg.instantiate()
macro OUTPUT()
    return isdefined(Main, :Franklin) ? Franklin.OUT_PATH[] : "/tmp/"
end;

md"""
## Overview

This tutorial will give examples of working with probability distributions and statistics in Julia. The key libraries are `Distributions.jl`, `StatsBase.jl`, and `StatsPlots.jl`, but there are others that provide more extensive functionality.
"""

# ## Simulating Random Variables

# test
