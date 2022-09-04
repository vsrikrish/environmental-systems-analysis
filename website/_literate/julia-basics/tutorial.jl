using Pkg #hideall
macro OUTPUT()
    return isdefined(Main, :Franklin) ? Franklin.OUT_PATH[] : "/tmp/"
end;

md"""
## Overview

This tutorial will give some examples of basic Julia commands and syntax.

## Getting Help
* Check out the official documentation for Julia: [https://docs.julialang.org/en/v1/](https://docs.julialang.org/en/v1/).
* [Stack Overflow](https://stackoverflow.com) is a commonly-used resource for programming assistance.
* At a code prompt or in the REPL, you can always type `?functionname` to get help.
"""

md"""
## Comments
Comments hide statements from the interpreter or compiler. It's a good idea to liberally comment your code so readers (including yourself!) know why your code is structured and written the way it is.
Single-line comments in Julia are preceded with a `#`. Multi-line comments are preceded with `#=` and ended with `=#`
"""

md"""
## Suppressing Output

You can suppress output using a semi-colon (;).
"""

4+8;
4+8

md"""
## Variables
Variables are names which correspond to some type of object. These names are bound to objects (and hence their values) using the = operator.
"""

x = 5

md"""
Variables can be manipulated with standard arithmetic operators.
"""

4 + x

md"""
Another advantage of Julia is the ability to use Greek letters (or other Unicode characters) as variable names. For example, type `\` followed by the name of the Greek letter (*i.e.* `\alpha`) followed by TAB. This can make code easier to read, and more obviously comparable to associated equations.
"""

α = 3 # The name of this variable was entered with \alpha + TAB + \_1

md"""
You can also include subscripts or superscripts in variable names using `\_` and `\^`, respectively, followed by TAB. If using a Greek letter followed by a sub- or super-script, make sure you TAB following the name of the letter before the sub- or super-script. Effectively, TAB after you finish typing the name of each `\character`.
"""
β₁ = 10 # The name of this variable was entered with \beta + TAB + \_1 + TAB

md"""
However, try not to overwrite predefined names! For example, you might not want to use `π` as a variable name...
"""

π

md"""
!!! tip "Overwriting predefined names"

    In the grand scheme of things, overwriting `π` is not a huge deal unless you want to do some trigonometry. However, there are more important predefined functions and variables that you may want to be aware of. Always check that a variable or function name is not predefined!
"""

md"""
## Data Types
Each datum (importantly, *not* the variable which is bound to it) has a [data type](https://docs.julialang.org/en/v1/manual/types/). 

!!! info "Variables and data"
    Strictly speaking, a variable points to a particular memory address, which holds the information associated with some datum or data. These pieces of memory can be used to store different data as the variable is overwritten. This can be restricted to varying degrees depending on the programming language. In a *statically typed* language like C, the compiler needs to allocate memory based on the data type, and so once a variable is initialized with a given type, this type cannot be changed, even if the data itself can be. In a *dynamically typed* language such as Python, the types associated with variables can be changed, which may mean the variable needs to be assigned to a different piece of memory. This is one reason why compiled (and usually statically-typed) languages are often faster than interpreted (and usually dynamically-typed) languaged.

Julia is a dynamically-typed language, which means that you do not need to specify the type of a variable when you define it, and you can change types mid-program. However, this does not work in Pluto, as Pluto tries to keep track of variables so it can update all cells in a notebook that refer to that variable when the variable changes upstream.

Julia types are similar to C types, in that they require not only the *type* of data (Int, Float, String, etc), but also the precision (which is related to the amount of memory allocated to the variable). Issues with precision won't be a big deal in this class, though they matter when you're concerned about performance vs. decimal accuracy of code.
You can identify the type of a variable or expression with the `typeof()` function.
"""

typeof("This is a string.")
typeof(x)

md"""
While Julia is dynamically-typed, you can specify the type of a variable when it is declared. This can increase speed, but perhaps just as importantly, can make it easier to identify type errors when debugging.
"""

typeof(9)
z::Int8 = 9
typeof(z)

md"""
### Numeric types
A key distinction is between an integer type (or *Int*) and a floating-point number type (or *float*). Integers only hold whole numbers, while floating-point numbers correspond to numbers with fractional (or decimal) parts. For example, `9` is an integer, while `9.25` is a floating point number. The difference between the two has to do with the way the number is stored in memory. `9`, an integer, is handled differently in memory than `9.0`, which is a floating-point number, even though they're mathematically the same value.
"""

typeof(9)
typeof(9.25)

md"""
Sometimes certain function specifications will require you to use a Float variable instead of an Int. One way to force an Int variable to be a Float is to add a decimal point at the end of the integer.
"""

typeof(9.)

md"""
In Julia, floats can also refer to complex numbers.
"""

typeof(5. + 1.1im) # im defines the imaginary part of the complex number

typeof(sqrt(Complex(-4))) # we get an error if we try to take the square root of a negative number without telling Julia that it should be prepared to work with complex floats

md"""
### Strings
Strings hold characters, rather than numeric values. Even if a string contains what seems like a number, it is actually stored as the character representation of the digits. As a result, you cannot use arithmetic operators (for example) on this datum.
"""

"5" + 5

md"""
However, you can try to tell Julia to interpret a string encoding a numeric character as a numeric value.
"""

Int("5") + 5

md"""
Two strings can be concatenated using `*`:
"""

"Hello" * " " * "there"

md"""
### Booleans
Boolean variables (or *Bools*) are logical variables, that can have `true` or `false` as values.
"""

b = true

md"""
Numerical comparisons, such as `==`, `!=`, or `<', return a Bool.
"""

c = 9 > 11

md"""
Bools are important for logical flows, such as if-then-else blocks or certain types of loops.
"""

md"""
## Mathematical operations
Addition, subtraction, multiplication, and division work as you would expect. Just pay attention to types! The type of the output is influenced by the type of the inputs: adding or multiplying an Int by a Float will always result in a Float, even if the Float is mathematically an integer. Division is a little special: dividing an Int by another Int will still return a float, because Julia doesn't know ahead of time if the denominator is a factor of the numerator.
"""

3 + 5
3 * 2
3 * 2.
6 - 2
9 / 3

md"""
Raising a base to an exponent uses `^`, not `**`.
"""

3^2

md"""
Julia allows the use of updating operators to simplify updating a variable in place (in other words, using `x += 5` instead of `x = x + 5`.
"""

md"""
### Boolean algebra
Logical operations can be used on variables of type `Bool`. Typical operators are `&&` (and), `||` (or), and `!` (not).
"""

true && true
true && false
true || false
!true

md"""
Comparisons can be chained together.
"""

3 < 4 || 8 == 12

md"""
!!! tip "Making orders of operations explicit"
	We didn't do this above, since Julia doesn't require it, but it's easier to understand these types of compound expressions if you use parentheses to signal the order of operations. This helps with debugging!
"""

(3 < 4) || (8 == 12)

md"""
## Data Structures
Data structures are containers which hold multiple values in a convenient fashion. Julia has several built-in data structures, and there are many extensions provided in additional packages.
"""

md"""
### Tuples
Tuples are collections of values. Julia will pay attention to the types of these values, but they can be mixed. Tuples are also *immutable*: their values cannot be changed once they are defined.
Tuples can be defined by just separating values with commas.
"""

test_tuple = 4, 5, 6

md"""
To access a value, use square brackets and the desired index.
"""

md"""
!!! note "Julia indexing"
    Julia indexing starts at 1, not 0!
"""

test_tuple[1]

md"""
As mentioned above, tuples are immutable. What happens if we try to change the value of the first element of `test_tuple`?
"""

test_tuple[1] = 5

md"""
Tuples also do not have to hold the same types of values.
"""

test_tuple_2 = 4, 5., 'h'
typeof(test_tuple_2)

md"""
Tuples can also be defined by enclosing the values in parentheses.
"""

test_tuple_3 = (4, 5., 'h')
typeof(test_tuple_3)

md"""
### Arrays
Arrays also hold multiple values, which can be accessed based on their index position. Arrays are commonly defined using square brackets.
"""

test_array = [1, 4, 7, 8]
test_array[2]

md"""
Unlike tuples, arrays are mutable, and their contained values can be changed later.
"""

test_array[1] = 6
test_array

md"""
Arrays also can hold multiple types. Unlike tuples, this causes the array to no longer care about types at all.
"""

test_array_2 = [6, 5., 'h']
typeof(test_array)
typeof(test_array_2)

md"""
### Dictionaries
Instead of using integer indices based on position, dictionaries are indexed by keys. They are specified by passing key-value pairs to the `Dict()` method.
"""

test_dict = Dict("A"=>1, "B"=>2)
test_dict["B"]

md"""
### Comprehensions
Creating a data structure with more than a handful of elements can be tedious to do by hand. If your desired array follows a certain pattern, you can create structures using a *comprehension*. Comprehensions iterate over some other data structure (such as an array) implicitly and populate the new data structure based on the specified instructions.
"""

[i^2 for i in 0:1:5]

md"""
For dictionaries, make sure that you also specify the keys.
"""

Dict(string(i) => i^2 for i in 0:1:5)

md"""
## Functions
A function is an object which accepts a tuple of arguments and maps them to a return value. In Julia, functions are defined using the following syntax.
"""

function my_function(x,y)
	# some stuff involving x and y
end

function my_actual_function(x, y)
	return x + y
end

my_actual_function(3, 5)

md"""
!!! note "Do you need to "return" values?"
    Functions in Julia do not require explicit use of a `return` statement. They will return the last expression evaluated in their definition. However, it's good style to explicitly `return` function outputs. This improves readability and debugging, especially when functions can return multiple expressions based on logical control flows (if-then-else blocks).
"""

md"""
Functions in Julia are objects, and can be treated like other objects. They can be assigned to new variables or passed as arguments to other functions.
"""

g = my_actual_function

function function_of_functions(f, x, y)
	return f(x, y)
end

function_of_functions(g, 3, 5)

md"""
### Short and Anonymous Functions
In addition to the long form of the function definition shown above, simple functions can be specified in more compact forms when helpful.
"""

# short form
h₁(x) = x^2 # make the subscript using \_1 + <TAB>

h₁(4)

# anonymous form
x->sin(x)

(x->sin(x))(π/4)

md"""
### Mutating Functions
The convention in Julia is that functions should not modify (or *mutate*) their input data. The reason for this is to ensure that the data is preserved. Mutating functions are mainly appropriate for applications where performance needs to be optimized, and making a copy of the input data would be too memory-intensive.
If you do write a mutating function in Julia, the convention is to add a `!` to its name, like `my_mutating_function!(x)`.
"""

md"""
### Optional arguments
There are two extremes with regard to function parameters which do not always need to be changed. The first is to hard-code them into the function body, which has a clear downside: when you do want to change them, the function needs to be edited directly. The other extreme is to treat them as regular arguments, passing them every time the function is called. This has the downside of potentially creating bloated function calls, particularly when there is a standard default value that makes sense for most function evaluations.

Most modern languages, including Julia, allow an alternate solution, which is to make these arguments *optional*. This involves setting a default value, which is used unless the argument is explicitly defined in a function call.
"""

function setting_optional_arguments(x, y, c=0.5)
	return c * (x + y)
end

md"""
If we want to stick with the fixed value $c=0.5$, all we have to do is call `setting_optional_arguments` with the `x` and `y` arguments.
"""

setting_optional_arguments(3, 5)

md"""
Otherwise, we can pass a new value for `c`.
"""

setting_optional_arguments(3, 5, 2)

md"""
### Passing data structures as arguments
Instead of passing variables individually, it may make sense to pass a data structure, such as an array or a tuple, and then unpacking within the function definition. This is straightforward in long form: access the appropriate elements using their index.
In short or anonymous form, there is a trick which allows the use of readable variables within the function definition.
"""

h₂((x,y)) = x*y # enclose the input arguments in parentheses to tell Julia to expect and unpack a tuple
h₂((2, 3)) # this works perfectly, as we passed in a tuple
h₂(2, 3) # this gives an error, as h₂ expects a single tuple, not two different numeric values
h₂([3, 10]) # this also works with arrays instead of tuples

md"""
### Vectorized operations
Julia uses **dot syntax** to vectorize an operation and apply it *element-wise* across an array.
For example, to calculate the square root of 3:
"""

sqrt(3)

md"""
To calculate the square roots of every integer between 1 and 5:
"""

sqrt.([1, 2, 3, 4, 5])

md"""
The same dot syntax is used for arithmetic operations over arrays, since these operations are really functions.
"""

[1, 2, 3, 4] .* 2

md"""
Vectorization can be faster and is more concise to write and read than applying the same function to multiple variables or objects explicitly, so take advantage!
"""

md"""
### Returning multiple values
You can return multiple values by separating them with a comma. This implicitly causes the function to return a tuple of values.
"""

function return_multiple_values(x, y)
	return x + y, x * y
end
return_multiple_values(3, 5)

md"""
These values can be unpacked into multiple variables.
"""

n, ν = return_multiple_values(3, 5)
n
ν

md"""
### Returning nothing
Sometimes you don't want a function to return any values at all. For example, you might want a function that only prints a string to the console.
"""

function print_some_string(x)
	println("x: $x")
	return nothing
end

print_some_string(42)

md"""
### Function signatures
You can specify the *signature* of a function by specifying the types of arguments and/or return value. This isn't necessary, but it can help with debugging. For example, suppose we did the following:
"""

function_of_functions(g, 3, "5")

md"""
This type of error can be hard to track down without clear commenting. Specifying the type expected by a function can help debug these types of errors.
"""

function new_function(f::Function, x::Int64, y::Int64)
	return f(x, y)
end

new_function(g, 3, 5)
new_function(g, 3, "5")

md"""
Notice that the error message here points out that the second numeric argument failed to match the expected type. 
"""

md"""
### Return types
We can also specify the expected output type of a function. This will cause the function to return the value as the specified type if possible, even if that isn't the "natural" result of the operation.
"""

function yet_another_function(x, y)::Int64
	return x + y
end

typeof(yet_another_function(3, 5.))

md"""
This will return an error if the result cannot be interpreted exactly as the specified type, which can be useful.
"""

yet_another_function(3, 2.5)

md"""
## Printing Text Output
The `Text()` function returns its argument as a plain text string. Notice how this is different from evaluating a string!
"""

Text("I'm printing a string.")

md"""
`Text()` is used when you want to *return* the string passed to it. To print directly to the console, use `println()`. 
"""

println("I'm writing a string to the console.")

md"""
### Printing Variables In a String
What if we want to include the value of a variable inside of a string? We do this using *string interpolation*, using `$variablename` inside of the string.
"""

bar = 42
Text("Now I'm printing a variable: $bar")

md"""
## Control Flows
One of the tricky things about learning a new programming language can be getting used to the specifics of control flow syntax. These types of flows include conditional if-then-else statements or loops.
"""

md"""
### Conditional Blocks
Conditional blocks allow different pieces of code to be evaluated depending on the value of a boolean expression or variable. For example, if we wanted to compute the absolute value of a number, rather than using `abs()`:
"""

function our_abs(x)
	if x >= 0
		return x
	else
		return -x
	end
end

our_abs(4)
our_abs(-4)

md"""
To nest conditional statements, use `elseif`.
"""

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

md"""
### Loops
Loops allow expressions to be evaluated repeatedly until they are terminated. The two main types of loops are `while` loops and `for` loops.
"""

md"""
#### While loops
`while` loops continue to evaluate an expression so long as a specified boolean condition is `true`. This is useful when you don't know how many iterations it will take for the desired goal to be reached.
"""

function compute_factorial(x)
	factorial = 1
	while (x > 1)
		factorial *= x
		x -= 1
	end
	return factorial
end

compute_factorial(5)

md"""
!!! warning
    While loops can easily turn into infinite loops if the condition is never meaningfully updated. Be careful, and look there if your programs are getting stuck.
"""

md"""
If the expression in a `while` loop is false when the loop is reached, the loop will never be evaluated.
"""

md"""
#### For loops
`for` loops run for a finite number of iterations, based on some defined index variable.
"""

# this function will add the numbers from 1 through x
function add_some_numbers(x)
	total_sum = 0 # initialize at zero since we're adding
	for i=1:x # the counter i is updated every iteration
		total_sum += i
	end
	return total_sum
end

add_some_numbers(4)

md"""
`for` loops can also iterate over explicitly passed containers, rather than iterating over an incrementally-updated index sequence. Use the `in` keyword when defining the loop.
"""

# this function will add all of the values passed in a container
function add_passed_numbers(set)
	total_sum = 0
	for i in set # this is the syntax we use when we want i to correspond to different container values
		total_sum += i
	end
	return total_sum
end

add_passed_numbers([1, 3, 5])

md"""
## Linear algebra
Matrices are defined in Julia as 2d arrays. Unlike basic arrays, matrices need to contain the same data type so Julia knows what operations are allowed. When defining a matrix, use semicolons to separate rows. Row elements should not be separated by commas.
"""

test_matrix = [1 2 3; 4 5 6]

md"""
You can also specify matrices using spaces and newlines.
"""

test_matrix_2 = [1 2 3
				 4 5 6]

md"""
Finally, matrices can be created using comprehensions by separating the inputs by a comma.
"""

[i*j for i in 1:1:5, j in 1:1:5]

md"""
Vectors are treated as 1d matrices. 
"""

test_row_vector = [1 2 3]
test_col_vector = [1; 2; 3]
test_col_vector = [1; 2; 3]

md"""
Many linear algebra operations on vectors and matrices can be loaded using the `LinearAlgebra` package.
"""

md"""
## Package management

Sometimes you might need functionality that does not exist in base Julia. Julia handles packages using the [`Pkg` package manager](https://docs.julialang.org/en/v1/stdlib/Pkg/). After finding a package which has the functions that you need, you have two options:

1. Use the package management prompt in the Julia REPL (the standard Julia interface; what you get when you type `julia` in your terminal). Enter this by typing `]` at the standard green Julia prompt `julia>`. This will become a blue `pkg>`. You can then download and install new packages using `add packagename`. 

2. From the standard prompt, enter `using Pkg; Pkg.add("packagename")`.

The `packagename` package can then be used by adding `using packagename` to the start of the script.
"""

