set.seed(100)
N=10
CX101 <- rnorm(N,45,8)
CX102 <- rnorm(N,65,8)
CX103 <- rnorm(N,85,25)
CX104 <- rnorm(N,60,15)
CX105 <- rnorm(N,55,15)

res <- data.frame(CX101,CX102,CX103,CX104,CX105)
naming_rows <- paste0("Student-",1:10)
rownames(res) <-naming_rows

#Problem 1

res_clean <- function(x){
  x[x>100] <- NA
  return(x)
}

res_clean <- apply(res, 2, res_clean)
res_clean

#Problem 2

average_value <- function(x){
  x[is.na(x)] <- mean(x,na.rm = TRUE)
  return(x)
}

average_value <- apply(res_clean, 2, average_value)
average_value

#Problem 3

library(ggplot2)
mpg

# the car with maximum displacement, with a subset feature
maximum_dis <- mpg |> subset(displ==max(displ),select = c("manufacturer","model","year","displ","cty","class"))
maximum_dis

# All 2 wheeler cars, with selected columns

two_seater <- mpg |> subset(class=="2seater",select =  c("manufacturer","model","year","displ","hwy","class"))
two_seater

#First 6 audi cars with selected columns
library(dplyr)

audi_6 <- mpg |> subset(manufacturer=="audi",select =  c("manufacturer","model","year","displ","cty"))|>
  head()
audi_6

?select
#Problem 4


