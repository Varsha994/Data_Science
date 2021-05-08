

############## Day7 ###############
library(ggplot2)

# titanic Dataset

getwd()
setwd('C:\\Users\\MEGHA\\Documents\\Data Science Material\\DS R')
# 

# ggplot - it is an enhanced visualization library used to make more no. of plots and charts.
# You can have both 2D and 3D.
# 
# ggplot - grammar of graphics plot(full form)
# geom_objectsName : 
# geom - geometry
# objectsName - barplot, boxplot, pointchart, histogram


?ggplot()


df = read.csv('titanic.csv')
head(df)

#dropping columns we dont need
df = df[-c(6,9,10,11)]

names(df)


# A. Univariate Analysis : 

# 1. Numerical cols

hist(df$Age, breaks = 10, col = cm.colors(10))
hist(df$Age, breaks = 10, col = cm.colors(10),
     xlab = "Age", main = "Histogram of Age")


#density plot
plot(density(df$Fare), col = "green")

polygon(x = density(df$Fare), col = "red")  #polygon colors the inside part of graph



# -- using ggplot ---
ggplot(data = df, mapping = aes(x = Age)) +
  geom_histogram()                            # aes: aesthetic

colSums(is.na(df))   #Age col has 177 na values hence its removed

ggplot(data = df, mapping = aes(x = Age)) +
  geom_histogram(color = "green")           

ggplot(data = df, mapping = aes(x = Age)) +
  geom_histogram(color = "green", fill = "blue")  #border green with blue filled


ggplot(data = df, mapping = aes(x = Age)) +
  geom_histogram(color = "green", fill = "red") + 
  labs(title = 'Histogram of Age', 
       xlab = "Age",
       ylab = "Count",
       subtitle = "subtitle .. ")


png("newFile.png")   #saving in png form
ggplot(data = df, mapping = aes(x = Age)) +
  geom_histogram(color = "green", fill = "red") + 
  labs(title = 'Histogram of Age', 
       xlab = "Age",
       ylab = "Count",
       subtitle = "sutitle .. ")
dev.off()


# 2. categorical cols
table(df$Sex)

barplot(height = table(df$Sex))
barplot(height = table(df$Sex), col = rainbow(2))
barplot(height = table(df$Sex), col = rainbow(2),
        names.arg = c("F", "M"))   #xlab, ylab, main


# -- ggplot --
ggplot(data = df, aes(x = Sex)) + 
  geom_bar(stat = 'count', fill = "green")

ggplot(data = df, aes(x = Sex)) + 
  geom_bar(stat = 'count', fill = cm.colors(2))



# B. Bivariate Analysis

# 1. Numerical vs Numerical cols comparison

# scatter plot
plot(x = df$Age, y = df$Fare)

#install.packages('hexbin')  #done

library('hexbin')
plot(hexbin(x = df$Age, y = df$Fare))


boxplot(df$Fare~df$Age)
# Y~aX1 + bX2 + cX3.....


## -- ggplot ---

ggplot(df, aes(df$Age, df$Fare, color = Sex)) + 
  geom_point()         #color is same as hue command of python



# 2. categorical vs numerical 
# table(df$Survived, df$Age)


boxplot(Age~Embarked, df)  # y axis before '~' sign and x axis after it 
abc = boxplot(Age~Survived, df)    
abc$out   # out = outliers
abc

boxplot(Age~Survived, df, col = rainbow(2))

boxplot(Age~Survived, df, col = df$Pclass)


## -- using ggplot ---
ggplot(df, aes(x = Embarked, y = Fare)) + 
  geom_boxplot()


ggplot(df, aes(x = Embarked, y = Fare)) + 
  geom_boxplot(fill = "red")



ggplot(df, aes(x = Embarked, y = Fare)) + 
  geom_boxplot(fill = cm.colors(4))



ggplot(df, aes(x = Embarked, y = Fare, color = Embarked)) + 
  geom_boxplot(outlier.colour = "red", outlier.shape = 5)


ggplot(df, aes(x = Embarked, y = Fare, color = Sex)) + 
  geom_boxplot(outlier.colour = "red", outlier.shape = 5)


# barplot for bivariate
ggplot(data = df, aes(x = Sex, y = Age)) + 
  geom_bar(stat = 'identity')


ggplot(data = df, aes(x = Sex, y = Age, color = Embarked)) + 
  geom_bar(stat = 'identity')


ggplot(data = df, aes(x = Sex, y = Age, color = Embarked)) + 
  geom_bar(stat = 'identity',position = position_dodge()) 




# 3. Categorical vs categorical plot
table(df$Survived, df$Sex)
dotchart(table(df$Survived, df$Sex))




















