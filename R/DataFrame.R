

########## Day 4 ##############

getwd()
setwd("C:\\Users\\Nitish\\Desktop\\R CLass")


## Data frames ###

# how to create a dataframe

args(data.frame)
?data.frame


# 1. from vectors
c1 <- c(5, 8, 3)
c2 = c(T, FALSE, F)
c3 = letters[1 : 3]

d1 = data.frame(c1, c2, c3)
d1
  
  

# 2. From List
listName = list("c1" = c(5, 8, 3), 
                "c2" = c(T, FALSE, F), 
                "c3" = letters[1 : 3])


d2 = data.frame(listName) #taken where we are declaring variables
d2
#or 
d3 = as.data.frame(listName) #taken when already declared variable
                             #type casting
d3

typeof(d2)
typeof(d3)

is.data.frame(d2) # checking if its dataframe or not


object.size(c1)
object.size(c2)
object.size(c3)


object.size(d1)

object.size(listName)
object.size(d2)



# 3. From Matrix
set.seed(10)
mat = matrix(as.integer(runif(30, 30, 60)), nrow = 10, ncol = 3,dimnames = list(letters[1 : 10], c("C1", "C2", "C3")))
args(matrix)

d4 = data.frame(mat)

object.size(mat)
object.size(d4)

  
is.data.frame(d4)


################## data frame ops #############

df = d4
df

#a. access the elements 
#access only col2

df["C2"]
df[, "C2"]

df$C2

#access d, e, f rows
df[4 : 6, ]
df[c('d', 'e', 'f'), ]
df[c("d" : "f"), ] # :apply for indices  only

#access col1 and col2
df[, -1]

#except b, c, d
df[-c(2 : 4), ]

# col3 except b, c, d rows
df[-c(2 : 4), c("C3")]


# b. it helps you to get number of columns
length(df)



set.seed(10)
mat = matrix(as.integer(runif(30, 30, 60)), nrow = 10, ncol = 3)
df = data.frame(mat)  #by default X1, X2, X3 col

# c. count number of rows and columns
dim(df)


# d. check names of columns in dataframe
names(df)


# e. rename columns / rows

colnames(df) = LETTERS[5 : 7]
rownames(df) = letters[1 : 10]

df



# f. read top 6 rows in the data frame - head;
# read top 6 rows from bottom - tail
head(df)
tail(df)

head(df, 3) # 3 rows from top
tail(df, 1) # 1 row from top


# g. statistical summary - summary
summary(df)


# h. combine dataframe column wise - cbind()
# combine dataframe row wise - rbind()

col4 <- data.frame("C4" = letters[15 : 24])
df_cbind = cbind(df, col4)
summary(df_cbind)

#Mode value is of no use, it doesn't give mode
#ex: taking 'p' twice to check

col4 <- data.frame("H" = c(letters[15 : 23], "p"))
df_cbind = cbind(df, col4)
summary(df_cbind)  #mode should be 'p' but its character(always)




new_row = data.frame(63, 63, 63)
colnames(new_row) = LETTERS[5 : 7]
rownames(new_row) = "k"

df_rbind = rbind(df, new_row)



# check
df
df_cbind
df_rbind

cbind(df_cbind, df_rbind) #error: rows are diff
rbind(df_cbind, df_rbind) #error: cols are diff


# i. information in data frames = str
str(df)


# k. Count number of NA's

df1 = df
str(df1)
rowSums(is.na(df1)) # count number of NA's per row
colSums(is.na(df1)) # count number of NA's per column


# j. working on NA's in data frame

df1[1, 1] = NA
df1[2, 1] = NA
df1[2, 2] = NA
df1[3, 3] = NA
df1[9, ] = NA


mean(df$E)
min(df$G)
max(df$F)
median(df$E)
sum(df$E)


# math functions applied on data with NA
mean(df1$E)
min(df1$G)
max(df1$F)
median(df1$E)
sum(df1$E)



# to get the values, despite NA
mean(df1$E, na.rm = T)  #ignores NA value
min(df1$G, na.rm = T)
max(df1$F, na.rm = T)
median(df1$E, na.rm = T)
sum(df1$E, na.rm = T)


# filling NA's - imputing with mean, median, mode
# get dataframe without NA
df1[is.na(df1)]
df1[!is.na(df1)]


colSums(is.na(df1)) #gives no of NAs in each col


# Impute NA using Mean
# we are replacing NA values with mean of all other values,
# with round of 2 decimal places
df1$E[is.na(df1$E)] = round(mean(df1$E, na.rm = T), 2)
df1



# Impute NA using Median
df1$F[is.na(df1$F)] = median(df1$F, na.rm = T)
df1



# Impute NA using Mode
df1$F[is.na(df1$F)] = mode(df1$G)  # mode actually shows the column data type(char, numeric)
                                   # hence redundant to use here
df1


# unique
length(df1$G)
u_value = unique(df1$G)
length(unique(df1$G)) # 7: since NA,40 & 55 are repeated twice


df1$G
match(df1$G, u_value) #will give uniquesindex numbers 
                      #repeat index numbers of previously occured values

tabulate(match(df1$G, u_value)) # gives chart that how many times no is being repeated


#calculates mod
which.max(tabulate(match(df1$G, u_value))) # getting max value at position 1 hence 1 o/p

u_value[which.max(tabulate(match(df1$G, u_value)))] #"55" is max value at index 1



#Function to replace NA values of col G with max value of col G
# basically calculating mode since no direct fn which gives mode

mode_fun <- function(x){
  u_value = unique(x)
  u_value[which.max(tabulate(match(x, u_value)))]
}

df1$G[is.na(df1$G)] = mode_fun(df1$G)


# make a query : using which function
# 'which' is applied only on rows 
df[which(df$E > 40), ]  # for all columns
df[which(df$E > 40), "G"]  #for particular column
df[which(df$E > 40 & df$F <= 40), ]  # %in%



#for column section, use 'in' operator
df[which(df$E > 45), "G" %in% names(df)]


#check whether each value of col is greater than mean of col3 using which fn 
df[which(df$E >= mean(df$G)), ]

#excluding rows which have mean > 40 in E col
df[-which(df$E > 40), ]





# readxl, dplyr, mlbench
















