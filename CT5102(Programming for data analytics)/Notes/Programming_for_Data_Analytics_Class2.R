v<-1:5
v
v%%2

v%%2==0
lv<- v[v%%2==0]
lv

v[lv]

#Functions it wll return the last evaluated result
evens<-function(v){
  
  v[v%%2==0]
}
ans<-evens(v)
ans

sample



remove_duplicate<-function(temp){
  v[!duplicated(v)]
  
}

set.seed(100)
v<-sample(1:6,10,replace=T)
duplicated(v) #it will return true if the vector has duplicates.
!duplicated(v)

v[!duplicated(v)]

m_unique<- remove_duplicate
m_unique(v)



set.seed(100)
v<-sample(1:10,10000,replace=T)


v<-c(1,2,3,NA)
sum(v)

sum(v,na.rm = TRUE)