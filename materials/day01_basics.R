#' ---
#' title: "R Basics"
#' author: "Andreas Blombach, Philipp Heinrich"
#' date: "08.11.2022"
#' output:
#'  html_document:
#'    theme: readable
#'    highlight: tango
#'    toc: true
#'    toc_float: true
#'    fig_width: 10
#' ---
#' 

#' ## Preliminary remarks
#' As you may have noticed, there is quite a bit of text in this script. This
#' text is designed to help you understand the actual code -- the lines which
#' are not preceded by a hash (#). You can directly execute the code (we'll get
#' to that in a minute). A better idea, however, might be to type it in again
#' yourself at the bottom of the console or to copy it into your own script
#' (with your own modifications and additions, if you like!) -- you'll probably
#' learn more this way!
#' 
#' If you're wondering why most comments in this script are followed by an
#' apostrophe (and why there is some weird stuff at the beginning), that's
#' because RStudio can be used to create specially formatted HTML files in
#' conjunction with the "knitr" and "rmarkdown" packages.
#' 
#' Headings, text formatting, lists, etc. are marked according to the
#' specifications of R Markdown (http://rmarkdown.rstudio.com/lesson-1.html).
#' 
#' And since we're already referencing URLs: 
#' A helpful "cheatsheet" for R can be found at:
#' https://github.com/rstudio/cheatsheets/blob/master/base-r.pdf
#' 


#' ## R as a calculator
#' Try entering some basic calculations!
#' 
1 + 1
2 ** 10
8 %/% 3

#' ## Objects
#' To work with data, we  use *objects*. Objects are stored in
#' the current *environment*. Single values, data structures and
#' functions are all objects.
#' 
#' To access an object, it needs a name. This name should start
#' with a letter (after that, you're free to use whatever
#' combination of letters, numbers and some special characters
#' (like dots or underscores) you like).
my_first_object <- 42 # the arrow assigns the value 42 to my_first_object
my_first_object = 42  # or just use the equality sign

#' https://stackoverflow.com/questions/1741820/what-are-the-differences-between-and-assignment-operators-in-r
#' 
#' Execute the line above by placing the cursor somewhere in it
#' and pressing CTRL+Enter (or by clicking "Run" in RStudio).
#' 
#' Notice that it will now appear in the environment.
#' 
#' You can now access the object's value by entering its name:
my_first_object

#' Create a few more objects. You can also assign the value of an
#' existing object to a new object (thereby copying it), do
#' calculations with objects and assign the result of these to
#' objects. (What happens when you multiply an object by itself
#' and assign the result to the same object?)
#' 

#' You can also see the objects in the current environment by
#' executing this function:
ls()

#' To get rid of an object, use `rm()`:
rm(my_first_object)

#' To get rid of *all* objects in the current environment:
rm(list = ls())

#' ## Functions
#' Functions like these can be recognised by the round brackets.
#' 
#' A function has a name (the characters before the brackets) and
#' may have different arguments (between the brackets), separated
#' by commas. Arguments may be either optional or obligatory.
#' 
#' For example, the following are well-known functions from highschool:
exp(1)
log(1)
exp(log(1))
log(2, base = 2)
log2(2)

#' The following function produces five random numbers between 1 and 10:
sample(1:10, 5)

#' To take a sample with replacement (allowing the same number
#' to be drawn multiple times), we can specify the optional
#' argument `replace`:
sample(1:10, 11, replace = TRUE)

#' ## Built-in documentation
#' To look up what a function does and how it works, you can
#' access the built-in documentation by typing `?` followed by the
#' function's name: `?sample`
?hist

#' Alternatively, you can use the `help` function:
help("seq")
help.search("barplot")
?help.search

help.start()  # searchable HTML documentation
# or use GUI menus to access & search documentation

#' If you enter a function's arguments in the exact same order
#' as seen in its documentation, you don't need to specify the
#' names of its arguments. If you do specify them, however, you
#' are free to enter them in any order you want:
sample(replace = TRUE, size = 5, x = 1:100)

#' ## Installing and loading packages
#' R already provides quite a lot of functions, but sooner or
#' later, you'll need some more ...
#' 
#' A package is a collection of functions and/or data sets,
#' usually for a certain range of applications (e.g. plotting,
#' linear mixed-effects models, corpus analysis, ...).
#' 
#' When packages are installed, they are stored locally (e.g. on
#' a hard drive). The set of installed packages can be thought of
#' as a library: if you need a certain package in your current
#' session, you can check it out (thus activating it).
#' 
#' To install a package (or several, by providing a vector of
#' package names):
#'  
#' - `install.packages("name_of_package")`
#' - `install.packages(c("package1", "package2", "package3"))`
#' 
#' By default, dependencies are also installed (= packages which
#' are required for your new package to work properly).
#' 
#' To activate an installed package:
#' 
#' - `library("name_of_package")`
#' - `library(name_of_package)`
#' 
#' (For whatever reason, quotation marks are optional in this
#' case.)
#' 
#' You can also use RStudio to install, update, activate and
#' deactivate packages.
#' 
#' A much more extensive tutorial (useful even for advanced
#' users):
#' https://www.datacamp.com/community/tutorials/r-packages-guide
#' 
#' We'll need some packages later, so let's activate them -- install them
#' on your local machine, if necessary:
library(tidyverse)
library(readxl)
library(data.table)

#' The Tidyverse is actually a whole collection of packages that
#' share a certain a certain approach and underlying philosophy.
#' The core packages (see https://www.tidyverse.org/packages/)
#' are:
#' 
#' - ggplot2 (graphics)
#' - dplyr (data manipulation)
#' - tidyr (tidying and pivoting data)
#' - readr (importing data)
#' - purrr (functional programming)
#' - tibble (an alternative to R's native data.frame)
#' - stringr (string manipulation)
#' - forcats (handling factors, i.e. categorial variables)
#' 
#' Some Tidyverse approaches to working and programming in R can
#' be considered as a dialect of R. There are therefore often
#' different ways of doing something. You can find nice
#' comparisons of base R and the Tidyverse (and `data.table` as
#' well) online, for example here:
#' https://wetlandscapes.com/blog/a-comparison-of-r-dialects/
#' 


#' ## Logical Operators
#' To check if values are equal, if one is greater than another
#' etc., we need logical operators.
a <- 5
b <- 2
#' Are a and b equal?
a == b

#' Is a greater than b?
a > b

#' Also:
a >= b # greater or equal
a < b # smaller
a <= b # smaller or equal
a != b # not equal

#' On its own, the exclamation mark ("not") negates an expression
!(a < b) # returns TRUE if the following expression is FALSE

#' We can use `&` (AND) and `|` (OR) to combine conditions:
a > b & a != b # TRUE if both sides are TRUE
a < b | a > b # TRUE if at least one of the sides is TRUE

#' If we want to know if only one of both sides is TRUE, we need
#' XOR (excluding OR):
xor(a < b, a > b) # TRUE
xor(a > b, a != b) # FALSE (since both conditions are TRUE)

#' Side note: There's also `&&` and `||` which behave somewhat
#' differently. Can you figure it out?
((-2:2) >= 0) & ((-3:1) >= 0)
((-2:2) >= 0) && ((-3:1) >= 0)


#' ## Data types
#' There are lots of types of data in R. Luckily, we won't need
#' all of them.
#' 
#' These are the most important basic types:
#' 
#' - numbers (integers and doubles)
#' - logical values (TRUE and FALSE)
#' - characters (= strings)
#' 
#' (Use `typeof()` to determine the basic type of objects.)
#' 
#' Data structures:
#' 
#' - vectors
#' - factors (ordered and unordered)
#' - matrices
#' - data sets (data.frame, tibble and data.table)
#' - lists
#' 
#' ## Vectors
#' Probably the most important data structure in R, a vector
#' contains elements of the same basic type (for different types,
#' you'll need lists). You can use the in-built function `c()` to concatenate 
#' several single objects to a vector.
#' 
test_vector <- c(3, 4.6, 64, 42)
test_vector

#' An easy way to create vectors of natural numbers is the ":" notation 
#' already used above:
1:10

#' Vectors of characters/strings or logical values are also
#' possible:
strings <- c("colourless", "green", "ideas")
strings
logicals <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
logicals

#' Vectors contain elements of the same type!
new_test_vector <- c(1, "zwei", 3)
new_test_vector
typeof(new_test_vector)  # the numeric values were coerced to characters!
rm(new_test_vector)

#' To get the number of elements in a vector, use `length()`:
length(test_vector)

#' Note that `length()` might not give you what you expected:
length("a character")  # this is a single object, a.k.a. "atomic vector"

#' We can use square brackets to access elements of a vector:
test_vector[1]
test_vector[2]
strings[2]

#' We can also use vectors of numbers to access several elements:
test_vector[1:3] # elements 1-3
logicals[2:4]
strings[c(1, 3)]

#' Vectors can be part of new vectors:
test_vector2 <- c(48, 120, 5, 32)
new_vector <- c(test_vector, test_vector2); new_vector

#' To sort a vector, use `sort()`:
sort(new_vector)
sort(new_vector, decreasing = TRUE)

#' Mathematical operators and many functions are vectorised which
#' means that when applied to a vector, you get a vector in
#' return:
new_vector + 2 # every element + 2
new_vector * 3 # every element multiplied by 3
sqrt(new_vector) # square root
round(new_vector)
round(new_vector, 1) # optional second argument: number of decimal places

#' R provides some useful methods to search inside of vectors:
#' 
#' Use `%in%` to check if a vector contains a certain value (if you're dealing
#' with large character vectors, `%chin%` from the `data.table` package is
#' faster):
48 %in% new_vector

#' `which()` returns the position(!) of elements that meet your
#' conditions (by using logical operators, see above):
which(new_vector == 42)
which(new_vector > 40)

#' Since this is a vector itself, you can use it to access the
#' elements of the original vector by their position:
new_vector[which(new_vector > 40)]
#' But this might be a little easier:
new_vector[new_vector > 40]

#' You can also combine conditions:
new_vector[new_vector > 40 & new_vector < 50]

#' ## Plotting
#' Base R offers basic but efficient plotting.
#' 
x <- 1:100
y <- 2^x

#' You can either plot values of a vector against its index:
plot(y)

#' ... or use two vectors to plot against one another
plot(x, y)  # in this case equivalent to the above
plot(y ~ x) # ditto

#' The basic plot function has several helpful parameters, e.g.
#' logarithmic scaling:
plot(x, y, log = "y")
plot(x, y, log = "x")
plot(x, y, log = "xy")
plot(log(x), log(y))  # what's the difference?

#' You can also choose different types of plots:
plot(x, y, type = "l")

#' There are many packages to create high-quality plots, among
#' them `ggplot2` (probably the most popular), `plotly` and
#' `lattice`. You can also create interactive visualisations
#' using Shiny (https://shiny.rstudio.com/). Don't worry, we will
#' explore all this in another session!