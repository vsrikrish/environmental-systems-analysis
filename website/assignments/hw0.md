@def class = "BEE 4750"
@def hascode = true
@def mintoclevel = 2
@def maxtoclevel = 3
@def showall = true

@def title = "Homework 0"
@def topic = "Debugging Julia Code"
@def due_date = Dates.format(DateTime(2023, 9, 7, 21), "E, m/dd, I:MM p")

@@banner
# {{title}}: {{topic}}
@@

@@duedate Due: {{due_date}} @@

\toc

## Overview

### Learning Objectives

After completing Homework 0, you should be able to:
  * identify the source of common code errors;
  * apply basic strategies of code debugging;
  * interpret code snippets;
  * use your knowledge of Julia to fix code.

### Instructions

Ensure that you have cloned the solution repository from Github Classroom, **using the link provided in Ed Discussion**.

This homework consists of a series of code snippets. For Problems 1--3, you will be asked to identify relevant error(s) and fix the code. For Problem 4, the code works as intended; your goal is to identify the code's purpose by following its logic.

To write and evaluate Julia code, encode your code in a ["Julia chunk"](https://weavejl.mpastell.com/stable/usage/#Markdown-Format). To do this, use the following syntax:

```
```julia
# insert your code here
```
```

\note{Those are backticks `` ` ``, *not* apostrophes `` ' ``!}

## Problems

### Problem 1 (25 points)

You've been tasked with writing code to identify the minimum value in an array. You cannot use a predefined function. Your colleague suggested the function below, but it does not return the minimum value.

```julia:./code/ex1
function minimum(array)
    min_value = 0 # variable which stores minimum value
    for i in 1:length(array)
        if array[i] < min_value
            min_value = array[i]
        end
    end
    return min_value
end

array_values = [89, 90, 95, 100, 100, 78, 99, 98, 100, 95]
@show minimum(array_values)
```

#### Problem 1.1 (10 points)

Describe the logic error.

#### Problem 1.2 (10 points)

Write a fixed version of the function.

#### Problem 1.3 (5 points)

Use your fixed function to find the minimum value of `array_values`.

### Problem 2

Your team is trying to compute the average grade for your class, but the following code produces an error.

```julia:./code/ex2
student_grades = [89, 90, 95, 100, 100, 78, 99, 98, 100, 95]

function class_average(grades)
  average_grade = mean(student_grades)
  return average_grade

@show average_grade
```

#### Problem 2.1

Describe the logic and/or syntax error.

#### Problem 1.2

Write a fixed version of the code.

#### Problem 1.3

Use your fixed code to compute the average grade for the class.

### Problem 3

Your team has collected data on the mileage of different car models. You want to calculate the average mileage per gallon (MPG) for the different cars, but your code produces an error.

```julia:./code/ex3
# function to calculate MPG given a tuple of miles and gallons
function calculate_MPG((miles, gallons))
    return miles / gallons
end

car_miles =  [(334, 11), (289, 15), (306, 12), (303, 20), (350, 20), (294, 14)]

mpg = zeros(length(car_miles))

for i in 1:length(car_miles)
    miles = car_miles[1][1]
    gallon = car_miles[1][2]
    mpg[i] = calculate_MPG((miles, gallon))
end  
@show mpg
```

Describe the logic error.

#### Problem 3.2

Write a fixed version of the code.

#### Problem 3.3

Use your fixed code to compute the MPGs.

### Problem 4

You've been handed some code to analyze. The original coder was not very considerate of other potential users: the function is called `mystery_function` and there are no comments explaining the purpose of the code. It appears to take in an array and return some numbers, and you've been assured that the code works as intended. 

```julia:./code/ex4
function mystery_function(values)
    y = []
    for v in values
        if !(v in y)
            append!(y, v)
        end
    end
    return y
end

list_of_values = [1, 2, 3, 4, 3, 4, 2, 1]
@show mystery_function(list_of_values)
```

#### Problem 4.1

Explain the purpose of `mystery_function`.

#### Problem 4.2

Add comments to each line of code, explaining what it is doing and why.

### Problem 5

**This problem is *required* for students in BEE 5750 and is *extra credit* for students in BEE 4750.**

Write a version of the code in Problem 3 that uses broadcasting instead of a `for` loop. Based on what you've learned about Julia, why might this be a preferable solution for this problem?
