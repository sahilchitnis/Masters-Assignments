#generate a random sample of 20 temperature from -5 to 30
?sample

set.seed(99)

temp<-sample(-5:30,20,replace = T)
temp
summary(temp)

t1<-ifelse(temp<4,"Cold","Not Cold")

t2<-ifelse(temp<4,"Cold",
           ifelse(temp>25,"Hot","Medium"))
t2
temp

temp[which(t2=="Hot")]