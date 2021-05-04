# Factor, Matrix:

#cran - comprehensive archive R network(website from where R installed) )

#how to install a package:


# dplyr - data manipulation
# ggplot2 - visualization 
# readxl - reading spreadsheets/ excel files
# mlbench - built in datasets
data()  #current available datasets

install.packages("dplyr")    #done
install.packages("violinplot") 
install.packages("mlbench")   #done
install.packages("ggplot2")   #done

library()  # gives list of inbuilt libraries

# dependencies will automatically install all files related to readxl
install.packages('readxl', dependencies = TRUE)  #done

remove.packages("readxl")  # to remove packages

#check if package is installed
#import libraryName

#import in R - Using library('packageName')
library('readxl')

####### Object: Factor ########
#combination of unique elements

#syntax : factor(x, labels,levels, ordered)

args(factor)  # will give args to pass 
args(seq)
args(runif)


#diff types of objects:
# vec, list, factor, matrix, dataframe 

# to check size of object:
# Syntax: object.size(variableName)

#Collection of homogenous elements
#It displays the sequence of elements and another variable levels
#levels: how many unique values are present in vector/sequence

#factor application : converts categorical to numerical with ordered relationship

#if we write numerical value in factor, it will be treated
#string as string has highest precedence

f1 <- factor(c("yellow","blue",'blue',"red","red","red",4, 3.6))


shirt_size = c("L","XL",'L','M','S','S','M',"XL")
f2 <- factor(x = shirt_size)

#cant compare different elements as of now
f2[1] < f1[2]


#we have to set levels as per requirement

level_c = c("S", "M", "L", "XL")
f3 <- factor(x = shirt_size, levels = level_c) 
f3[1] < f3[2]  #error since we haven't ordered in factor fn

# S < M < L < XL
f3 <- factor(x = shirt_size, levels = level_c, ordered = TRUE)
f3[1] < f3[2]


fac_num <- factor(c(2 : 12, seq(1, 20, 2)))


#check if variable is factor
is.factor(fac_num)

######## Object : Matrix ###########

#collection of elements of same data types in 1D/2D dimension 
#contains rows and column

#Syntax: matrix(data, nrow, ncol, dimnames)

args(matrix)

#create matrix of 12 elements
aMat = matrix(1 : 12)
aMat = matrix(1 : 12, nrow = 3)  # setting no of rows fix
aMat = matrix(1 : 12, ncol = 3)
aMat = matrix(1 : 12, nrow = 3, ncol = 3)

# Even if we give lesser matrix values than no of rows and cols,
# R will replicate the given values
mat = matrix(1 : 3, nrow = 3, ncol = 3)

bMat = matrix(1 : 12)
bMat = matrix(1 : 12, nrow = 3, byrow = TRUE)  
bMat = matrix(1 : 12, ncol = 3, byrow = TRUE)
bMat = matrix(1 : 12, nrow = 3, ncol = 3, byrow = TRUE)


cMat <- matrix(seq(from = 5, by = 10, length.out = 9), nrow = 3, byrow = TRUE)

#for random series
random_series = as.integer(runif(30, 10, 100))

# random series matrix:
dMat = matrix(data = random_series, ncol = 3)

#to access elements of matrix:
#display 3rd col:
dMat[,3]

# 65, 33, 53
dMat[6,]

#65 33 53
dMat[3:5, 2]

# from row 3 to 5, col 2 only
dMat[c(3:5), 2]

#from row 4 to 8
dMat[4 : 8, 1:3]

#from row 4 to 8 except 2nd col
dMat[4 : 8, c(1,3)]

#entire dataset except col 1:
dMat[,-1]
#or
dMat[, c(2,3)]


#except 3rd and 7th row:
dMat[-c(3,7),]
#or
dMat[c(-3,-7),]


#NAMES
set.seed(10)
random_series = as.integer(runif(30, 10, 100))
random_series
m = matrix(data = random_series, ncol = 3)
m

#naming columns
colnames(m) <-  c("C1", "C2", "C3")

#naming rows
rownames(m) <- letters[1 :10]
m

#passing col and row names in dimnames
set.seed(10)
random_series = as.integer(runif(30, 10, 100))
random_series
m = matrix(data = random_series, ncol = 3)
m

m = matrix(data = random_series, ncol = 3,dimnames = list(letters[1 :10],c("C1", "C2", "C3")))
m

#except col2, entire dataset
m[, -"C2"] #error
m[, -2]
m[, c("C1","C3")]

m[c("a","c","i"),"C3"]


#how to read col 1
m[, 1]
m[,"C1"]


#Binding Operation: Binds 2 matrices of same size
# 1. column Binding: cbind()
#no of rows should be same

mat1 = matrix(1 : 3)
mat1

mat2 = matrix(7 : 9, nrow = 3,ncol = 2)
mat2

mat3 = matrix(5 : 3) #by default ordered by col
mat3

mat4 = matrix(5 : 2)
mat4

mat = cbind(mat1, mat2,mat3)  #nrow = 3 in all matrices
mat = cbind(mat1, mat2, mat3, mat4) #error coz mat4 has 4 rows
mat

# 2. Row Binding: rbind()
#no of columns should be same

mat1 = matrix(1 : 3, ncol = 3)
mat1

mat2 = matrix(7 : 9, nrow = 2,ncol = 3)
mat2

mat3 = matrix(5 : 3, ncol = 3)
mat3

mat4 = matrix(5 : 2, ncol = 4)
mat4

mat = rbind(mat1, mat2, mat3)
mat = rbind(mat1, mat2, mat3, mat4) # error coz mat4 has 4 cols
mat

typeof(mat)  
is.vector(mat)  #False
is.matrix(mat)

#we can create a matrix by adding: seq, random, vec






















