# This file was generated, do not modify it. # hide
function compute_factorial(x)
	factorial = 1
	while (x > 1)
		factorial *= x
		x -= 1
	end
	return factorial
end

compute_factorial(5)