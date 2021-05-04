
# Run: ctrl + enter
getwd()  # gives working directory

#to set path:
setwd("C:\\Users\\VARSHA\\Documents\\Data Science Material\\DS R")

#Data Types in Python:
# numeric(int/float), string, boolean, complex

# 2 ways to assign a value to variable:
a = 10
a <- 10  
b <-100   
c <- 99  # error: c -> 99


#pandas(file = , index =  )

# Data types in R:

# 1. String : ''  ""
s1 = 'Hello'
s2 = "Friend"
s1 + s2
print(s1)
print(s2)

print(s1,s2)  # will give error
print(c(s1,s2,"2021"))

# help in R: displays R documentation 
help(print)
#or
?print

paste(s1,s2)  #similar to print(multiple parameters can be passed)

#To take input from the user:
#readline

age <- readline("what is your age :")


# Data type check:
typeof(name)
typeof(age)


#typecasting / coercion:
age <- as.integer(age) #converts data type to integer
age <- as.numeric(age) #converts data type to double

a <- "kdjkd"  # no need to intialize the variable
b = 7673L #when L is added at the end, it converts to integer from double

typeof(a)  
typeof(b)  
class(b)  # class() also gives data type of the variable

#Data Types in R:
# fundamental data type: vector

# 1. String 
# 2. Number
# 3. Boolean:
a <- True  #gives error True should be in caps
typeof(a)
a <- TRUE  #logical data type

a <- T   # TRUE or T, FALSE or F

#clr screen : ctrl + L


#to find the number of characters in the string
str <- "Hello World!"
nchar(str)


# to check if the character "H" is present in the variable
str = "Hello World!"
grepl("H",str)

# to show environmental variables :
ls()   
rm(age)   #removes single variable

rm(list = ls())  #removes all variables(start fresh)


# 4. Complex:

num1 = 5 + 6i
typeof(num1)   #complex data type
num2 = -6i
typeof(num2)


# Objects in R: Collection of different data types
# 1. Vector : Collection of elements of different data types.
#             Rest all the objects are form of vector only

# 2. list
# 3. Factor
# 4. Matrix
# 5. Dataframe

# 1. Vector :
vec1 <- 11 : 22   #gives sequence of numbers starting from 11 till 22
vec2 <- c(22, 100, -3.3, TRUE, "hello", "R")  #diff data type elements,
                                              #higher precedence is given(character)
 
typeof(vec1)      #integer
is.vector(vec1)   #is vec1 a vector or not 
typeof(vec2)      #character
is.vector(vec2)

vec3 <- c(22, 100, -3.3, TRUE)
typeof(vec3)      #double
is.vector(vec3)


#precedence order:
# char > num > logical(T/F)


vec4 <- c(1 : 5, TRUE, c("A","B"), -3.3)
vec4
typeof(vec4)

vec4[1]  # display in 1 line

# to write alphabetical vectors:

vec5 <- letters[1:10]  #lowercase 
vec5 <- LETTERS[1:10]  #uppercase
vec5

# Sequence function: to create vectors(only numerical)
#syntax: seq(from, to, by, length.out)


vec6 = seq(from = 10, to = 100)
vec6

variableName = 100
variableName_ = 100
1232variableName = 27  #error

varia.name_ = 100  #full stop is only allowed in R 

typeof(vec6)      #integer
is.vector(vec6)


# first 20 even nos:
vec7 = seq(from = 10, to = 100, by = 2) 
vec7

v1 = seq(from = 25, to = 40, by = 2) 
v1

# first 50 odd nos:
vec8 = seq(from = 1, by = 2, length.out = 50) 
vec8  #length.out: no of terms we want


#repitation fun : repeat a variable
#Syntax: rep(variableName, integerNum)

rep()
help(rep)

rep(10,3)     #repeating 10 3 times
rep(vec8, 2)  #repeating vec8 2 times

v <- rep(1,10)  ##repeating 1 10 times
v


rep(c(1, 3, 5), c(1, 3, 5))   # o/p: 1 3 3 3 5 5 5 5 5
  
# generate abbccc:
rep(letters[1 : 3], c(1, 2, 3))

# aaabbc:
rep(letters[1 : 3], c(3, 2, 1))

#vector inside vector:
a <- c(1 : 10, T, c(3, 6))
a

# c() is used to create empty vector and vector of diff data types 

#create empty vector
v = c()  
v

# random numbers
# runif(n, min, max)

v1 = runif(10, 10, 20)
v1
is.vector(v1)

#if we want same random numbers to be generated all time:
set.seed(10)
v1 = runif(10, 10, 20)
v1
is.vector(v1)


set.seed(100)
v1 = as.integer(runif(10, 10, 20)) #typecasting it to int type
v1
is.vector(v1)

# Operations in Vector:
# position / index: vName[index]
set.seed(100)
v1 = as.integer(runif(10, 10, 20)) #typecasting it to int type
v1
v1[3]
v1[1]

# to remove any particular element
v1[-3] # "-" removes element at index position

#naming a vector
set.seed(100)
v1 = as.integer(runif(10, 10, 20)) 
v1

names(v1)  # initially no names assigned

#assigning index
names(v1) <- letters[1:10]
v1
v1["f"]
v1["d"]

v1['a']
v1[-'a'] #error: '-' works only on elements and not their index

#slicing
#syntax: vName[start : end]

v1[1 : 5]  # end is inclusive
v1
v1["a" : "e"]  # error: only index position with nos allowed
v1[c('a','b',"e")]

v1[c(10, 5, 66)]  # since 66th index not present,hence NA

#print all elements except from index d to f: 
v1[-c("d", "e", "f")]  #error

#correct ways:
v1[-c(4, 5 , 6)]
v1[c(-4, -5 , -6)]
v1[-c(4 : 6)]
v1[-(4 : 6)]


# Mathematical Operations:
sqrt(100)
floor(10.3)
exp(3)

a = c(2 : 3)
b = 6 : 9

# if lengths of variables a & b are same, 
# we can directly perform the operation 
a + b
a - b
a * b
a / b
c(a, b) # concatenation

thismatrix <- matrix(c("apple", "banana", "cherry", "orange"), nrow = 2, ncol = 2)



















