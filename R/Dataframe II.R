
########## Day 5 ##############

getwd()
setwd("C:\\Users\\MEGHA\\Documents\\Data Science Material\\DS R")


# data set ; csv excel notepad ; 

# 4. dataframe from inbuilt dataset

data()
Titanic
head(Titanic)


?Titanic
is.data.frame(Titanic) #T
is.data.frame(Orange)  #F : only some of the datasets are dataframe in built

df <- as.data.frame(Titanic)

is.data.frame(df)

head(df)  # bydefault 6 values

dim(df)  # gives no of rows and columns

summary(df)

df1 <- Orange
is.data.frame(Orange)

is.data.frame(df1)    




# call mlbench
library(mlbench)  #to import package  mlbenchh
# rerun data() to watch the datasets



# use data set name in single or double quotes to call the data in R if using 3rd party data set
data("BostonHousing") 

BostonHousing
is.data.frame(BostonHousing)

head(BostonHousing)

df2 <- BostonHousing
# rm(BostonHousing)
head(df2)


# 5. read from csv files
# sep, header, fileName

df_csv = read.csv("sample_csv_file.csv")

head(df_csv)

is.data.frame(df_csv)

df_csv = read.csv("sample_csv_file.csv", header = T) #features are taken as headers
df_csv = read.csv("sample_csv_file.csv", header = F) #features are taken as row 1

# "," separators are bydefault
df_csv = read.csv("sample_csv_file.csv", header = T, sep = ",")

dim(df_csv)



# 6. read from notepad files
# sep, header, fileName

df_notepad = read.table("sample_text_file.txt", sep = "\t")
head(df_notepad)


df_notepad = read.table("sample_text_file.txt", sep = "\t", header = T)
head(df_notepad)


# read.csv and read.table reads Tabular form of data, so you can use it interchangebly

df_csv_2 = read.csv("sample_text_file.txt", header = T, sep = "\t")
df_notepad_2 = read.table("sample_csv_file.csv", sep = ",", header = T)

head(df_csv_2)
head(df_notepad_2)


# 7. read from excel files 
library(readxl)
excel_file = read_excel("sample_excel_file.xlsx")
head(excel_file)
colnames(excel_file)

?read_excel

# wrt sheet
excel_file = read_excel("sample_excel_file.xlsx", sheet = "Sheet1")
head(excel_file)


excel_file = read_excel("sample_excel_file.xlsx", sheet = "Sheet2") #blank since no data in sheet 2
head(excel_file)


excel_file = read_excel("sample_excel_file.xlsx", sheet = 1)
head(excel_file)


excel_file = read_excel("sample_excel_file.xlsx", sheet = 2)
head(excel_file)

# skip command - skip rows from top
excel_file = read_excel("sample_excel_file.xlsx", sheet = 1, skip = 3)
head(excel_file)


# header - include it or not, using col_names
excel_file = read_excel("sample_excel_file.xlsx", sheet = 1, col_names = F) # no colnames
head(excel_file)






df = read_excel("sample_excel_file.xlsx", sheet = "Sheet1")
head(df)


head(df$Topic)
head(df['Topic'])





# rownames(df)

# View Command : helps you to watch dataframe in table format in R window
View(df)  #does not open in editor, cant edit only view

View(Orange)
View(BostonHousing)


# edit : edit(df_name)
# edit the data set in editor

edit(df)  #opens data editor pop up box where we can actually edit dataset
head(df)

# can't edit it directly. save changes in another variable
edit_df = edit(df)
head(edit_df)


# fix : fix(df_name)
# helps you to edit the data permanently, opens in data editor

fix(df)
head(df)
# df[3 : length(df), ]

is.vector(df)

ls()


# for (each in ls()){
#   print(is.vector(each))
# }




######## Convert categorical to numerical ######


df = read.csv("sample_csv_file.csv")
head(df)


unique(df$location)

# drop duplicates : 
dim(df)  # before 105 rows and 5 cols
df <- unique(df)
dim(df)  # now 97 rows and 5 cols

#to convert categorical to numerical:
# used in python : onehotencoding, labelencoder, get_dummies

#to convert categorical to numerical in R:
# 1. without any ordered 
# Base R itself, 

# creating new cols to store binary(0/1) values acc to location 
df$location_Mumbai = ifelse(df$location == "Mumbai", 1, 0)
df$location_Delhi = ifelse(df$location == "Delhi NCR", 1, 0)
df$location_Bengaluru = ifelse(df$location == "Bengaluru", 1, 0)
df$location_Chennai = ifelse(df$location == "Chennai", 1, 0)
df$location_Ahmedabad = ifelse(df$location == "Ahmedabad", 1, 0)
df$location_Kolkata = ifelse(df$location == "Kolkata", 1, 0)

colnames(df)
head(df)

# drop location column
df <- df[-3]



# 2. fastDummies : without ordered values(similar to getdummies of python)

install.packages("fastDummies")

df = read.csv("sample_csv_file.csv")
head(df)
dim(df)
unique(df$location)

# drop duplicates : 
df <- unique(df)

library(fastDummies)
df <- dummy_cols(df, select_columns = "location")
head(df)

# drop location column
df <- df[-3]


# 3. factor : give priority to values inside the column
df = read.csv("sample_csv_file.csv")
head(df)
dim(df)
unique(df$location)

# drop duplicates : 
df <- unique(df)

### process -

vec <- unique(df$location)
?factor

#giving precedence orders
level_vec <- c("Kolkata", "Chennai", "Ahmedabad", "Mumbai", "Bengaluru", "Delhi NCR")
fac_1 = factor(x = vec, levels = level_vec, ordered =T)


# actually implement  in dataset
# categorical values intact
df$location = factor(x = df$location, levels = level_vec, ordered =T)
head(df)

df$location[1] < df$location[2]



# convert categorical values to numerical
df$location = factor(x = df$location, levels = level_vec, ordered =T, labels = c(1,2,3,4,5,6))
head(df)

df$location[1] < df$location[2]  #now able to compare values since precedence is given

summary(df$location) #frequency of location
typeof(df$location)


summary(df)


# dplyr package : 
library(dplyr)

# plyr # package

# It does not provide any new functionality to R, it just makes the commands simpler and with little more sense

# Some of the key "verbs" provided by the dplyr package are

# . select: return a subset of the columns of a data frame, using a flexible notation
# . filter: extract a subset of rows from a data frame based on logical conditions
# . arrange: reorder rows of a data frame
# . rename: rename variables in a data frame
# . mutate: add new variables/columns or transform existing variables
# . summarise / summarize: generate summary statistics of different variables in the data frame,
# possibly within strata
# . %>%: the "pipe" operator is used to connect multiple verb actions together into a pipeline

library(tidyverse)   #superset of dplyr
#install.packages("tidyverse", dependencies = T) #done

df = read.csv("sample_csv_file.csv")
head(df)
dim(df)
unique(df$location)

# drop duplicates : 
df <- unique(df)


#1. select : select subset of dataset
# select(dataframeName, colNames)

# taking one column at a time
select(df, "experience") #gives column names
#or
select(df, experience)  #df$experience


# take multiple cols 
select(df, job_desig, placement_count)


# exclude cols
df[, -"placement_count"]   #error
select(df, -placement_count)


# select cols, that start with some value or end in some value
select(df, starts_with("job"))
select(df, ends_with("Date"))  #since no such colname ends with date, hence no o/p



#2. filter : select data as per condition
# filter(dataframeName, condition)
head(df)
summary(df$placement_count)

df1 = filter(df, placement_count >= mean(placement_count))
head(df1)
dim(df1)  # 45 obs are having value greater than mean of whole placement_count col


df2 = filter(df, placement_count >= mean(placement_count) & location == "Mumbai")
head(df2)
dim(df2)


# 3. arrange - reorder rows 
# arrange(dataframeName, colName)

arrange(df, placement_count)  #in ascending order of placement_count
arrange(df, desc(placement_count))



# 4. rename - 
# rename(df_Name,  newValue = oldValue, ) {here dont use <- operator, only =}
colnames(df) <- LETTERS[1 : 5]

df = read.csv("sample_csv_file.csv")
head(df)
dim(df)
unique(df$location)

# drop duplicates : 
df <- unique(df)
df = rename(df, "JOb" = "job_desig", Placed = placement_count)

























