# This file was generated, do not modify it. # hide
function test_sign(x)
	if x > 0
		return Text("x is positive.")
	elseif x < 0
		return Text("x is negative.")
	else
		return Text("x is zero.")
	end
end

test_sign(-5)