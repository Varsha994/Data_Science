
# Exercises for dplyr

library(dplyr)
?mtcars
names(mtcars)

df = mtcars
head(df)

# Exercise 1
# Print out the hp column using the select() function.

select(df, "hp" )


# Exercise 2
# Print out all but the hp column using the select() function.

select(df, -'hp')


# Exercise 3
# Print out the mpg, hp, vs, am, gear columns.

select(df, 'mpg' , 'hp', 'vs', 'am', 'gear')
#or
select(df, mpg, hp, vs, am, gear)



# Exercise 4
# Create the object mycars containing the columns mpg, hp columns but let the column names be miles_per_gallon, and horse_power.

mycars = select(mtcars, mpg, hp) %>%
  rename(miles_per_gallon = mpg, horse_power = hp)

head(mycars)

#or

mycars = rename(df, miles_per_gallon = mpg, horse_power = hp)


# Exercise 5
# Create a new variable in the mycars data frame km_per_litre using the mutate() function. Hint: 1 mpg is 0.425 km/l.

mycars = mutate(df, km_per_litre = mpg * 0.425)



# Exercise 6
# Print out the mycars_s object without any duplicates. Hint: Consider using the distinct() function.

dim(unique(df))     #distinct and unique function are same
dim(distinct(df))

mycars_s = distinct(df)
head(mycars_s)


# Exercise 7
# Print out from mycars_s object all the observations which have mpg>20 and hp>100.

mycars_s = filter(df, mpg > 20, hp > 100)
head(mycars_s)
#or

mycars_s = filter(df, mpg > 20 & hp > 100)


# Exercise 8
# Using dataset mtcars, Print out the row corresponding to the Lotus Europa car.

head(df)
rownames(df)
df[rownames(df) == 'Lotus Europa', ]
  
#or

filter(df, rownames(df) =='Lotus Europa')

#or

filter(df, rownames(df) %in% 'Lotus Europa')



  
  













