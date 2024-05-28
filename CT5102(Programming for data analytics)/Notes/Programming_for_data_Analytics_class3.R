set.seed(100)
L<-as.list(sample(1:100,10))
L
str(L[1:2])


L[[1]]
L[[2]]

m<-L[[1]]
for(i in 2:length(L)){
  if(L[[i]]>m)
    m<-L[[i]]
  
}
  
max(m)

#Functionals: A function can accept another function as an argument. These functions are known 
#as functionals and are key part of R.

# An important aspect of programming with R, which is the use of functionals. They tale data and functions
# as part of their input and uses that function to process data
# In many cases, these fucntions can be used instead of loops to iterate over data and return 
#a result


view(L)


L2<- list(1:4,
          2:6,
          10:11)
L2

L_out<- vector(mode="list",length=length(L2))

for(i in seq_along(L2)){
  L_out[[i]]<-max(L2[[i]])
}

L_out2<-lapply(L2, max)

a1<- lapply(L2, function(x){
  browser()
  list(x[1])
  
})

library(repurrrsive)


# Native Pipe Operator |>
# 

set.seed(100)

runif(10) |> max()
1:5 |> sqrt() |> max() -> ans
ans

l1<- list(a=1:5,b=100:200,c=1000:5000)
l1

ans<- lapply(l1,mean)
ans$c
