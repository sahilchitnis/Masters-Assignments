cars <- as.list(mtcars)
str(cars)
#Problem 1
result <- list(mean_mpg=vector(mode="numeric",length = 1),
               mean_disp=vector(mode = "numeric",length = 1))
str(result)
mean_disp_mpg<- cars[c("mpg","disp")]
for(i in 1:length(mean_disp_mpg)){
  
  result[[i]] <- mean(mean_disp_mpg[[i]])
}
str(result)
#-----------------------------------------------
#Problem 2
library(repurrrsive)
sw_people
has_height <- vector(mode="logical",length = length(sw_people))
for(i in 1:length(sw_people)){
  
  has_height[[i]] <- sw_people[[i]]$height!="unknown"
}
sw_people1 <- sw_people[has_height]
sum(has_height)
length(sw_people1)
#-----------------------------------------------
#Problem 3
characters <- c()
for(i in 1:length(sw_people1)){
  
    if(as.numeric(sw_people1[[i]]$height)>=225){
      characters <- c(characters,sw_people1[[i]]$name)
      
    }
}

characters
#-----------------------------------------------
#Problem 4
sum_diameters <- 0
exclude <- c()
for(i in 1:length(sw_planets)){
    if(sw_planets[[i]]$diameter=="unknown"){
      exclude <- c(exclude,i)
    }
    else
    {
      sw_planets[[i]]$diameter_numeric <- as.numeric(sw_planets[[i]]$diameter)
      sum_diameters <- sum_diameters+sw_planets[[i]]$diameter_numeric
    }
}
mean_diameter <- sum_diameters/length(sw_planets)
sw_planets1 <- sw_planets[-exclude]
sw_planets1
gte_mean <- c()
for(i in seq_along(sw_planets1)){
  if(sw_planets1[[i]]$diameter_numeric > mean_diameter)
    gte_mean <- c(gte_mean,sw_planets1[[i]]$name)
}
exclude
mean_diameter
gte_mean[c(1:3,(length(gte_mean)-2):length(gte_mean))]
#-----------------------------------------------
#Problem 5

c_species <- vector(mode="character",length = length(sw_species))
for(i in 1: length(sw_species)){
  c_species[[i]] <- sw_species[[i]]$classification
  
}
t_species <- table(c_species)
t_species

#-----------------------------------------------
#Problem 6


get_even1 <- function(x){
  x[x%%2==0]
}
set.seed(100)
x <- sample(1:20,10)
x

x1 <- get_even1(x)
x1

#-----------------------------------------------
#Problem 7

get_even2 <- function(y,na.omit=FALSE){
  if(na.omit==TRUE)
  {
    y <- y[!is.na(y)]
  }
  y[y%%2==0]
}
set.seed(200)
y <- sample(1:20,10)
i <- c(1,5,7)
y[i] <- NA

y1 <- get_even2(y,na.omit = TRUE)
y1

#-----------------------------------------------
#Problem 9
a <- 100
env_test <- function(b,c=20){
  a+b+c
}
env_test(1)
#-----------------------------------------------
#Problem 9

l1 <- list(a=1:5,b=100:300,c=1000:5000)
ans <- unlist(lapply(l1,median))
ans


