## manipulating the data using dplyr and tibble

#load packages
library(Tidyverse)
library(dplyr)
library(tibble)

#create Tab in dataframe
my_table <- data.frame(
  sample = paste0("sample", 1:20), 
  tumor_type = NA,
  `date of Dx` = NA,
  `date of t/t` = NA,
  stringsAsFactors = FALSE


##filter f() of dplyr - for filtering the data by "values"
iris
head(iris)
filter(iris, Sepal.Length > 5)
filter(iris, Sepal.Length > 5 & Petal.Width < 0.4)
filter(iris, Sepal.Length > 5 | Petal.Width < 0.4)
filter(iris, Sepal.Length > 5 & Petal.Width == 0.4)
filter(iris, Petal.Width %in% c(2.1,1.9,2.5))

##select f() of dplyr [] - for filtering the data by "columns"
head(mtcars)
#for selecting only the 3 columns
select_mtcars <- select(mtcars, mpg, cyl, carb)
select_mtcars
select(mtcars, 1:4, 7, 9)
select(mtcars, 1, 4, 7, 9)
select(mtcars, mpg:hp, qsec, am)
select(mtcars, -mpg, -qsec)
#when we dont know exact name of a column
select(mtcars, starts_with("h"))
select(mtcars, starts_with("H", ignore.case = TRUE))
select(mtcars, contains("A", ignore.case = TRUE))
select(mtcars, num_range("mpg", 1:4, width=2))

##arrange - sort in arranging and desending order based on a column
arrange(mtcars, mpg)
arrange(mtcars, desc(mpg))

##mutate - to add a new column, deleting a column.
airquality
mutate(airquality, All_Mean_Month = mean(Month))
mutate(airquality, All_Mean_Temp = mean(Temp), Difference_Per_Day = Temp - All_Mean_Temp)
mutate(airquality, Temp = NULL)

##rename - to replacde name of columns
names(mtcars)
rename(mtcars, pushpa = mpg)

##summarise - for calculating mean, median, sd, IQR, mad, min, max
?summarise
?dplyr::summarise()
str(mtcars)
summarise(mtcars, mean(disp))
summarise(mtcars, mean(disp), n())
summarise(mtcars, Mean_mpg = mean(disp), N = n() )
summarise(mtcars, mean(mpg), n_distinct(mpg))
#if you have NA in Data
summarise(airquality, mean(Ozone, na.rm = TRUE))

##group_by
airquality
group_by(airquality, Ozone)
AqbOz <- group_by(airquality, Ozone)
summarise(AqbOz, mTemp = mean(Temp), n())
group_by(airquality, Ozone, Temp)

##%>% or Then - doing in a series.
mtcars_series <- mtcars %>% select(mpg,wt,cyl) %>% arrange(wt) %>% group_by(mpg) 
view(mtcars_series)

##Rbind, Cbind, merge, join in R - for merging Data in R
team_1 <- data.frame(player = c("joy",'tom', "sam","rocky"), sport = c("hockey", "cricket", "Basketball","boxing"))
team_2 <- data.frame(player = c('sam','hardy'), sport = c('tennis', 'football'))

#Rbind for merging two similar(same columns) data frames
rbind(team_1,team_2)
team_ID <- data.frame(player_ID = c(11,12,13,14))

#cbind for merging two different data frames of same no of rows
cbind(team_ID, team_1)
team_age <- data.frame(player = c('joy', 'tom', 'rocky'), age = c(25,27,29), experience = c(10,6,11))
team_age
cbind(team_age,team_1) 

#above f() is not possible so we use merge for different column and rows.
merge(team_age,team_1) #here it f() like cbind
merge(team_ID,team_age)
merge(team_1,team_2)

#merges different datasets with with same column(but different names) and (matching) rows
team_age_1 <- data.frame(playername = c('joy', 'tom', 'rocky'), age = c(25,27,29), experience = c(10,6,11))
merge(team_1, team_age_1, by.x = "player", by.y = "playername")  
#merges different datasets with with same column(but different names) and (matching + nonmatching) rows
merge(team_1, team_age_1, by.x = "player", by.y = "playername", all.x = TRUE)
merge(team_1, team_age_1, by.x = "player", by.y = "playername", all.y = TRUE)
#merges different datasets with with same column(but different names) and (matching + nonmatching) rows
merge(team_1, team_age_1, by.x = "player", by.y = "playername", all = TRUE)


## Join same like merge but ysed for BIGG datasets
band_members
band_instruments2
innere_join(band_members, band_instruments2, by = c("name = artist") )

install.packages("janitor")
library(janitor)
library(readxl)

## 'janitor' A new package
# for cleaning rownames we use clean_names f()
adorn_totals() # for calculating total
get_dupes() # for dupes



data=data.frame(id=c(1,2,3,4,5,6), 
                name=c("sravan","bobby","ojaswi","gnanesh", 
                       "rohith","satwik"), 
                marks=c(89,90,98,78,98,78)) 

# shuffle the dataframe by rows 
shuffled_data= data[sample(1:nrow(data)), ] 

# display 
print(shuffled_data) 
