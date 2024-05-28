#------
# Name:- Sahil Chitnis
# Student ID:- 23100637
#------

set.seed(100)

N=5
Day1 <- rnorm(N,5,2)
Day2 <- rnorm(N,7,3)
Day3 <- rnorm(N,12,4)
Day4 <- rnorm(N,14,2)
Day5 <- rnorm(N,10,3)


temps <- matrix(c(Day1,Day2,Day3,Day4,Day5),nrow =5 ,ncol = 5, dimnames = list(c("Galway","Dublin","Cork","Linrick","Sligo"),
                                                 c("Day1","Day2","Day3","Day4","Day5")))
temps

is.matrix(temps)


maximum_temps <- apply(temps, 1, max)
maximum_temps
temps_2 <- cbind(temps, maximum_temps)
temps_2



colnames(temps_2)[ncol(temps_2)] <- "Max_Temp"
temps_2