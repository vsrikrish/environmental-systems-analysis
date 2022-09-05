# This file was generated, do not modify it. # hide
function add_some_numbers(x)
	total_sum = 0 # initialize at zero since we're adding
	for i=1:x # the counter i is updated every iteration
		total_sum += i
	end
	return total_sum
end
add_some_numbers(4)