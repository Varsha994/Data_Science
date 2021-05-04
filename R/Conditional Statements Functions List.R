# Random numbers :

# Create a vector of 10 random elements
set.seed(100)  # seed will always give same random numbers
v1 = as.integer(runif(10,10,20))
v1

length(v1)
min(v1)
max(v1)
mean(v1)
median(v1)
mode(v1) #function to find mode
sum(v1)

#index, slicing, length, assigning a value to vector
#syntax: vName[position] <-newValue

names(v1) <- LETTERS[1:10]
v1
v1[3] =100
v1["A"] = 99


#NA and NULL:
# NA: it has occupied space, just no value is assigned to it
# NULL: It has not occupied space(vacant)
v1[5] = NA
v1[6] = NA
v1

#to check if NA is there:

is.na(v1)   #boolean function, return either True or false
v1[is.na(v1)]   #pops out only NA elements

# check vector withour NA
v2 = v1[!is.na(v1)]  #excluding blank values
length(v2)  

#math functions with NA
# If vector contains NA elements, math funcs will not work
min(v1)
max(v1)
mean(v1)
median(v1)
sum(v1)

#math functions without NA
min(v1, na.rm = TRUE)   # na.rm : removes NA elements
max(v1, na.rm = T)
mean(v1, na.rm = T)
median(v1, na.rm = T)
sum(v1, na.rm = T)

#pass a vector with NA:
na.pass(v1)

#fail a vector with NA:
na.fail(v1)  #error

#NA and NULL:
# NULL: vacancy, no existence of vector
set.seed(100)
v1 = as.integer(runif(10,10,20))
v1

v1[8] = NULL  #error(since null is vacant so cant be replaced on occupied space NA )

vec1 = c(9 : 12, letters[6 : 8], F, NA)
vec2 = c(9 : 12, letters[6 : 8], F, NULL)
vec1
vec2
length(vec1) # o/p: 9 with NA
length(vec2) # o/p: 8 with NULL

vec1 = c(9 : 12, NA, seq(3, 10, 2))
vec2 = c(9 : 12, NULL, seq(3, 10, 2))

mean(vec1)  # gives NA
mean(vec2)  # gives mean value

vec1 <- NA
vec2 <- NULL  
length(vec1)
length(vec2)

is.vector(vec1)  # true
is.vector(vec2)  # false

# to create null vector:
v <- c()
v <- c(NULL)

# access element at position

set.seed(100)
v1 = as.integer(runif(10,10,20))
v1

v1[10] <- 99
v1 <- NA   # assign single element NA to entire vector

v1 <- NULL 
is.vector(v1)  # False since its null 

# print<10 0>
xx = c(2, 5, 10, 2, 0)
xx
xx[c(3,5)]

# R command to get o/p as <11 11 11 11 11 30 30 30 30 30 2 2 2 2 2>
rep(c(11, 30, 2), each = 5)



######## Conditional statements ########

# 1. if else loop:
#syntax:
if(condition){
  statements
}else if(condition){
  state...
}else{
  state...
}

marks = as.integer(readline("Enter Marks : "))
if(marks >= 80){
  print("A")
}else if(marks >= 60 & marks < 80){
  print("B")
}else{
  print("C")
}


# For loop:
#syntax:
for(iter in 1:10){
  state
}

for(iter in vName){
  state
}


set.seed(100)
v1 = as.integer(runif(10,10,20))
v1

for(i in 1:6){
  print(v1[i])
}

for(i in 1 : length(v1)){
  print(v1[i])
}

for(i in v1){
  print(i)
}

# While loop:
#syntax: 
iter = value
while(logic){
  state...
  iter = iter + 1
}


#factorial program:
num = as.integer(readline("Enter any number :"))
fact = 1
while(num > 0){
  fact = fact * num
  num = num - 1
}
paste("Factorial = ", fact)


#fibonacci, prime

#break and next

# break: if cond is true, it will come out of the loop
# ex: come out of loop when 10 comes

v1
for(each in v1){
  if(each == 10){break
    }else{print(each)}
}

# next: Skips the statement where cond is true and goes to next statement for execution
# ex: skip when 10 comes and continue next iteration

for(each in v1){
  if(each == 10){next
  }else{print(each)}
}


######### Functions #########
functionname <- function(arguments){
  state....
  return(vName)
}

functionName(parameters...)
 
#creates separate section of function in environmental section
fact_fun <- function(num){   # here num is formal argument
  fact = 1
  while(num > 0){
    fact = fact * num
    num = num -1
  }
  return(fact)
}

num = as.integer(readline("Enter any number :"))
fact_fun(num)
paste("Factorial = ", fact_fun(num))

# arguments in R:
# Positional, keywords, default

area.circle <- function(radius, pieValue){
  area = radius * radius * pieValue
  return(area)
}
# r = 10, pie = 3.14

# 1.Positional arguments:
area.circle(10, 3.14)  
area.circle(3.14, 10)  #it takes 1st value as radius, and 2nd as pie

# 2.Keyword arguments:
area.circle(radius = 10, pieValue = 3.14)  
area.circle(pieValue = 3.14, radius = 10)  
area.circle(pieValue = 3.14, r = 10)  
area.circle(pieValue = 3.14, 10)  #since pie is fixed, hence radius is taken automatically

# 3.Default arguments
area.circle <- function(radius, pieValue = 3.14){
  area = radius * radius * pieValue
  return(area)
}

area.circle(radius = 10)  # user didn't give pie value so it will take default 3.14 value given by coder
area.circle(radius = 10, pieV = 3.2)  # explicitly given by user to consider this



########### Object : List ###############
# Collection of elements of different data types
#list()

vec <- c(5 : 12)
vec
is.vector(vec)

vec <- c(5 : 12, letters[5 : 12], c(T, FALSE))

listname <- list(vec) # another structure opened in global env. section

"Here listname is like tabular data, if we specify cols and rows,
it will give data in tabular format"

listname <- list("col1" = 5 : 12, "col2" = letters[5 : 12], "col3" = c(T, FALSE))
listname

#if we don't give heading as col1, col2, col3:
listname2 <- list(5 : 12, letters[5 : 12], c(T, FALSE))


#access the elements of list
listname2[2]    #will create default header of [[1]]
listname2[[2]]  #entire thing pops out & will not create default header of [[1]]

# to access particular element in list
listname2[[2]][4]  # find "h"
listname2[[3]][2]  # find FALSE


#find 7 in listname
listname[["col1"]][3]

names(listname2)  #NULL
names(listname)   #"col1" "col2" "col3"

listname["col1"]

#simple method to check for element in any list
listname$col1[3]    # '$' suggests column name available in list
listname$col3[2]

##listname2$ :not applicable where we dont provide col name explicitly

# List within list
listname2[2]

listname
newList <- list("s1" = seq(3, 10, 3), "s2" = rep(0, 5))

listname$col4 <- newList  #inserts new list in col4

# access 9 from s1 of col4 from 'listname' list
listname$col4$s1[3]


# print all elements of list using for loop:
for(each in listname){
  print(each)
}


for(each in listname2){
  print(each)
}


# every sequence in R is bydefault vector only
is.vector(listname)  # True
is.list(listname)    # True
 














