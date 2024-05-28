#programming for data analytics
library(ggplot2)

#Creating larger vector we can use the below functions
#Colon operator:
x<-1:10
x
type_of(x)

#seq()function
x0<-seq(1,10)
x0

x1<-seq(from=1,to=10)
x1

x2<-seq(from=1,to=10,by=0.5)
x2
#rep() function(). In the below example 1 is repeated 10 times.
y1<-rep(1,10)
y1<-rep(1:3,times=3) # this will repeat 1,2,3 three times.
y1<-rep(1,10)
y1
#vector() function()
y1<-vector("logical", length=3)
y1


#Missing values

v<-1:10
v
#enforcing NA at 10th Position()
v[10]<-NA
v
#below method can be used to set multiple NA in the vector
v[c(1,7)]<-NA
#notice how summary() deals with NA value. Will give min median max.
summary(v)

#Notice what happens when we try to get the max value of v
max(v)

#the below function will look for missing values in the vector v
is.na(v)
sum(is.na(v))

#to remove NA we can use the below function
max(v,na.rm=TRUE)

#Vectorisation

#set the random number seed to 100. It is used to replicate the same sequence.It is a random
#number generator
set.seed(100)
#Create a sample of 5 numbers from 1 to 10 take 5 values. 
v<-sample(1:10,5)
v
typeof(v)
length(v)
#call the vectorised function square root
rv<-sqrt(v)
rv

x<-c(10,20,30)
y<-c(5)
x+y

#Relational operation operation is vectorisation operation.
v<-c(5,1,4,2,6,8)
v

#ifelse() function can be used to create a new atomic vector
v<-1:10
v
#calculate the mean
m_v<-mean(v)
m_v

# Create a new vector des_v based on a condition and using ifelse.It will compare the v with 
#mean value of m_v and return true if it is satisfied.
des_v<-ifelse(v>m_v,"GT","LE")
des_v

#subsetting. It allows you to process data stored in atomic vectors, and R provides a range
#of flexibility approaches that can be used to subset the date.

#below function will
rpois

