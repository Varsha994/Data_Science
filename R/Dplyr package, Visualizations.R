

########## Day 6 ################

# dplyr package, visualization

getwd()
setwd("C:\\Users\\MEGHA\\Documents\\Data Science Material\\DS R")



# dplyr continue ..
df = as.data.frame(matrix(as.integer(runif(30, 10, 30)), nrow = 10))
df

names(df) <- c("C1", "C2", "C3")

# 5. mutate : add new variables/columns or transform existing variables
# mutate(dfName, newCol = logic)
# mutate(dfName, oldCol = logic) # changing old col values to new values
df$C4 = LETTERS[10 : 19]
df

library(dplyr)

df = as.data.frame(matrix(as.integer(runif(30, 10, 30)), nrow = 10))
df
names(df) <- c("C1", "C2", "C3")
mutate(df, C4 = LETTERS[10 : 19])
mutate(df, sum_col = C1 + C2 + C3)

mutate(df, avg_col = mean(C1 + C2 + C3))

mutate(df, C2 = C2 - mean(C2))

mutate(df, C1 = C1 + median(C1))

median(df$C1)

# multiply 0.5 to all data columns except C1
mutate(df, C2=C2*0.5, C3 = C3*0.5)
#or

mutate(df,multiply=0.5*df[2:3])

# mutate(df, c(C2*0.5, C3*0.5))
mutate(df, df[-1] * 0.5)


# 6. group by , summarize
# it is used to generate summary stats from df.
# new_group = group_by(dfName, col)

df = as.data.frame(matrix(as.integer(runif(30, 10, 30)), nrow = 10))
df
names(df) <- c("C1", "C2", "C3")

#adding 1 col of categorical values to group
df$C4 = c(LETTERS[7 : 9], LETTERS[7 : 9], LETTERS[7 : 9], "H")

unique(df$C4)
new_group = group_by(df, C4)
typeof(new_group)

summarise(new_group, mean(C1))
summarise(new_group, mean(C1), max(C2))
summarise(new_group, mean(C1), max(C2), median(C3))

stats.table = summarise(new_group, mean(C1), max(C2), median(C3), .groups = "keep")
stats.table = summarise(new_group, mean(C1), max(C2), median(C3))

stats.table$`mean(C1)`
stats.table$`median(C3)`

typeof(stats.table)

paste(stats.table$`mean(C1)`)

#n() : frequency count of each unique variable
# here its giving how many unique times 'G' ,'H','I' has occurred

stats.table = summarise(new_group, mean(C1), max(C2), median(C3), n(), .groups = "keep")

#.group : to avoid warning, include in case warning occors

stats.table = summarise(new_group,C1.mean =  mean(C1),C2.max =  max(C2), C3.median = median(C3),Count =  n(), .groups = 'keep')



# stats.table = summarise(new_group,"C1.mean" =  mean(C1),'C2.max' =  max(C2), 'C3.median' = median(C3),'Count' =  n())


# 7. pipe operator : %>%
# helps you to stinging together multiple operations in a sequence

# first(x) %>% second(x) %>% third(x)
#1st operation will perform, then 2nd then 3rd

third(second(first(x)))  #starts from innermost bracket


df = as.data.frame(matrix(as.integer(runif(30, 10, 30)), nrow = 10))
df
names(df) <- c("C1", "C2", "C3")

#since df already mentioned in 1st step, we dont have to mention during group_by and summarise operations
new.table = df %>%
  mutate(C4 = c(LETTERS[7 : 9], LETTERS[7 : 9], LETTERS[7 : 9], "H")) %>%
  group_by(C4) %>%
  summarise(mean(C1), max(C2), median(C3), n(), .groups = 'keep')


new.table


df
# perform same %>% operation, multiply 0.5 to C2 and add mean(c1) to c1
df %>%
  mutate(C2 = 0.5 * C2, C1 = mean(C1) + C1)




################ Visualization ##################

# In Python: matplotlib, seaborn, plotly, bokeh

#In R:

# all types of 2D and 3D can be done with R

# plot names in Python:

# scatter, plot, boxplot, histogram, line, barplot, pairplot, kde plot, catplot, violin plot
# univariate analysis - analysis of 1 col at a time
# bivariate analysis - analysis of 2 col at a time

#In R: 
# Basic Plots :

# 1. Generic / Plot 
x <- seq(1, 10)
y <- seq(10, 100, 10)

plot(x, y)
# default : point type
plot(x, y, type = "p") # point plot
plot(x, y, type = "l") # line plot
plot(x, y, type = "b") # both open point and line plot( b = both)
plot(x, y, type = "o") # both closed point and line plot
plot(x, y, type = "s") # step plot




# 2. strip plot - 
stripchart(x)  #horizontal line
stripchart(x, vertical = T)  #vertical line


# 3. hist - frequency of data values
arr1 = as.integer(runif(10, 10, 30))
hist(arr1)  #gives how many elements are lying in particular range

hist(arr1, col = 'red') 
hist(arr1, col = 'blue')
hist(arr1, col = 'green')

#to give variation of color: cm(color map)
hist(arr1, col = cm.colors(4))  # nos represent type of color variation
hist(arr1, col = cm.colors(10)) 


arr1 = as.integer(runif(100, 10, 50))
hist(arr1)
hist(arr1, col = cm.colors(10), breaks = 10) # bins = breaks
hist(arr1, col = cm.colors(10), breaks = 2) # bins = breaks
hist(arr1, col = cm.colors(10), breaks = 3) # bins = breaks

# border col parameter
hist(arr1, col = cm.colors(10), border = "red", breaks = 3) 

# xlab, ylab, main = title
hist(arr1, col = cm.colors(10), border = "red", breaks = 3,
     xlab = "Array1", ylab = "Count", main = "First Histogram") 



# 4. pie chart - pie(x, label)
department <- c("Sales", "IT", "HR", "Manager")
emp_count = c(100, 40, 6, 42)


pie(x = emp_count, labels = department)

#using diff colors
pie(x = emp_count, labels = department, col = cm.colors(4))

#using rainbow, nos represent how many rainbow colors we can take it up
pie(x = emp_count, labels = department, col = rainbow(4))

# viridis
# install.packages("viridis") # done
library(viridis)

pie(x = emp_count, labels = department, col = viridis(4),
    main = "Pie Chart", clockwise = T, radius = 1)



#how to save this file: automatically saved in current location(getwd())

png(filename = "Pie_png.png")
pie(x = emp_count, labels = department, col = viridis(4),
    main = "Pie Chart", clockwise = T, radius = 1)
dev.off()  # without this, content will not be visible 


#saving in pdf format:

pdf(file = "Pie_PDF.pdf")
pie(x = emp_count, labels = department, col = viridis(4),
    main = "Pie Chart", clockwise = T, radius = 1)
dev.off()



# boxplot - outliers, iqr, quartiles, min, max, 

col1 = as.integer(runif(100, 10, 50))
col2 = c(10 : 30, 10 : 30, 10 : 30, 1 : 30, 10 : 16)  #taking 100 values

# using 1 column :
boxplot(x = col2)

max(col2)
min(col2)
median(col2)
quantile(col2, 0.25) # 25th % quartile
quantile(col2, 0.75) # 75th % quartile

bx = boxplot(x = col2)


typeof(bx)
bx$stats  #gives statistical parameters
bx$out    #gives outliers







