set.seed(100.0)
#Generating random values
Random_Sample_Vector<-rnorm(100,mean = 7,sd=4)

#Rounded the values to 1 decimal place
rounded_value<-round(Random_Sample_Vector,digits=1)
rounded_value

#Naming the vectors
days_name<-paste0("D-",c(1:100))
days_name

names(rounded_value)<-days_name
rounded_value


#Head of the vector
head(rounded_value)

#Tail of the vector
tail(rounded_value)

mean_Store<- mean(rounded_value)
mean_Store

# Problem 1

gt_mean<- length(rounded_value[rounded_value > mean_Store])
gt_mean

# Problem 2

max_temp<- max(rounded_value)
max_temp

days<- which.max(rounded_value)
  
cat("The max temperature was on day",days,"with a value of ",temp)

# Problem 3

min_temp<- min(rounded_value)
min_temp

days<- which.min(rounded_value)

cat("The min temperature was on day",days,"with a value of ",temp)

# Problem 4

warnings <- c("Warning","Normal")
warnings

w_warnings<-ifelse(rounded_value<=4.0,"Warning","Normal")

rounded_value[40:44]

w_warnings[40:44]

# Problem 5

gl<-w_warnings=="Warning"

w_days<-length(w_warnings[gl])
w_days

cat("The number of days the warning were in operation = ", w_days)

# Problem 6

names(w_warnings[gl])

# Problem 7

tw<-table(w_warnings)
tw

