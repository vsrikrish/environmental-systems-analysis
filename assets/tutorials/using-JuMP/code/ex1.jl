# This file was generated, do not modify it. # hide
using Pkg #hideall
Pkg.activate("_literate/using-JuMP/Project.toml")
Pkg.instantiate()
macro OUTPUT()
    return isdefined(Main, :Franklin) ? Franklin.OUT_PATH[] : "/tmp/"
end;