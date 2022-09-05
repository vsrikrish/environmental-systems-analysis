# This file was generated, do not modify it. # hide
function add_passed_numbers(set)
	total_sum = 0
	for i in set # this is the syntax we use when we want i to correspond to different container values
		total_sum += i
	end
	return total_sum
end
add_passed_numbers([1, 3, 5])