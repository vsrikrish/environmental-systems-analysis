# This file was generated, do not modify it. # hide
using Pkg #hideall
macro OUTPUT()
    return isdefined(Main, :Franklin) ? Franklin.OUT_PATH[] : "/tmp/"
end;