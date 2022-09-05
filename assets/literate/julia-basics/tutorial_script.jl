# This file was generated, do not modify it.

using Pkg #hideall
macro OUTPUT()
    return isdefined(Main, :Franklin) ? Franklin.OUT_PATH[] : "/tmp/"
end;

4+8;

4+8

x = 5

4 + x

α = 3

β₁ = 10 # The name of this variable was entered with \beta + TAB + \_1 + TAB

π

typeof("This is a string.")

typeof(x)

typeof(9)

typeof(9.25)

typeof(9.)

"5" + 5

parse(Int64, "5") + 5

"Hello" * " " * "there"

b = true

c = 9 > 11

3 + 5

3 * 2

3 * 2.

6 - 2

9 / 3

3^2

true && true

true && false

true || false

!true

3 < 4 || 8 == 12

(3 < 4) || (8 == 12)

# Data Structures

test_tuple = 4, 5, 6

test_tuple[1]

test_tuple[1] = 5

test_tuple_2 = 4, 5., 'h'
typeof(test_tuple_2)

test_tuple_3 = (4, 5., 'h')
typeof(test_tuple_3)

test_array = [1, 4, 7, 8]
test_array[2]

test_array[1] = 6
test_array

test_array_2 = [6, 5., 'h']
typeof(test_array)

typeof(test_array_2)

test_dict = Dict("A"=>1, "B"=>2)
test_dict["B"]

[i^2 for i in 0:1:5]

Dict(string(i) => i^2 for i in 0:1:5)

function my_actual_function(x, y)
	return x + y
end
my_actual_function(3, 5)

g = my_actual_function
g(3, 5)

function function_of_functions(f, x, y)
	return f(x, y)
end
function_of_functions(g, 3, 5)

h₁(x) = x^2 # make the subscript using \_1 + <TAB>
h₁(4)

x->sin(x)
(x->sin(x))(π/4)

function setting_optional_arguments(x, y, c=0.5)
	return c * (x + y)
end

setting_optional_arguments(3, 5)

setting_optional_arguments(3, 5, 2)

h₂((x,y)) = x*y # enclose the input arguments in parentheses to tell Julia to expect and unpack a tuple

h₂((2, 3)) # this works perfectly, as we passed in a tuple

h₂(2, 3) # this gives an error, as h₂ expects a single tuple, not two different numeric values

h₂([3, 10]) # this also works with arrays instead of tuples

sqrt(3)

sqrt.([1, 2, 3, 4, 5])

[1, 2, 3, 4] .* 2

function return_multiple_values(x, y)
	return x + y, x * y
end

return_multiple_values(3, 5)

n, ν = return_multiple_values(3, 5)
n

ν

function print_some_string(x)
	println("x: $x")
	return nothing
end
print_some_string(42)

Text("I'm printing a string.")

println("I'm writing a string to the console.")

bar = 42
Text("Now I'm printing a variable: $bar")

function our_abs(x)
	if x >= 0
		return x
	else
		return -x
	end
end

our_abs(4)

our_abs(-4)

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

test_sign(0)

function compute_factorial(x)
	factorial = 1
	while (x > 1)
		factorial *= x
		x -= 1
	end
	return factorial
end

compute_factorial(5)

function add_some_numbers(x)
	total_sum = 0 # initialize at zero since we're adding
	for i=1:x # the counter i is updated every iteration
		total_sum += i
	end
	return total_sum
end
add_some_numbers(4)

function add_passed_numbers(set)
	total_sum = 0
	for i in set # this is the syntax we use when we want i to correspond to different container values
		total_sum += i
	end
	return total_sum
end
add_passed_numbers([1, 3, 5])

test_matrix = [1 2 3; 4 5 6]

test_matrix_2 = [1 2 3
				 4 5 6]

[i*j for i in 1:1:5, j in 1:1:5]

test_row_vector = [1 2 3]

test_col_vector = [1; 2; 3]

