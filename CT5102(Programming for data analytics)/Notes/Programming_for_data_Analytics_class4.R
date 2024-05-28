#Data Frames
#On an intuitive level, a data frame is similar to a matrix, with two dimentional row and column
#structure.

head(mtcars)

View(mtcars)

x<-as.list(mtcars)
x


x<-list(mtcars)
x

#subset() function is used for metrices but mostly for dataframes. 3 args, 
#1) x, the object to be subsetted
#2) subset, a logical expression indicating which rows should be kept
#3) select, which indicates the columns to be selected from the dataframe(similar to select in sql).
#If this is not present, call columns are returned.


iris
head(iris)
tail(iris)
iris[100:101,]

summary(iris)

iris[which.max(iris$Sepal.Length),]

subset(iris,Sepal.Length==max(Sepal.Length))

iris[iris$Sepal.Length==max(iris$Sepal.Length),]


iris$SLG <- iris$Sepal.Length>mean(iris$Sepal.Length)
iris

names(iris)

summary(iris$SLG)

#Tibbles
#it is a dataframe but with extra features

iris[,1]
library(mpg)
library(ggplot2)
mpg
mpg[,1]


# complete.cases() is used to find missing values. It returns a logical vector indicating which cases are complete 
#,i.e, have no missing values. 

# Problem 1
library(ggplot2)
mpg

max_displ<- mpg |> subset(displ==max(displ),select = c("manufacturer","model","year","displ","cty","class"))
max_displ


# Problem 2
two_seater<-mpg|> subset(class=="2seater",select = c("manufacturer","model","year","displ","hwy","class"))
two_seater

# Problem 3

audi_6 <- mpg |> head()
audi_6


audi_6<- mpg |> subset(manufacturer=="audi",select=c("manufacturer","model","year","displ","cty"))|>head()
audi_6

library(aimsir17)
observations


plot(observations$temp)

rp1016<- observations |> subset(station=="ROCHES POINT" & month==10 & day==16) |> 
                subset(select=c(hour,wdsp,msl,rain))
rp1016

plot(rp1016$hour,rp1016$wdsp)
