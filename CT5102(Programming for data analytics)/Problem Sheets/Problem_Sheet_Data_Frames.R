set.seed(100)
N=10
CX101 <- rnorm(N,45,8)
CX102 <- rnorm(N,65,8)
CX103 <- rnorm(N,85,25)
CX104 <- rnorm(N,60,15)
CX105 <- rnorm(N,55,15)

# Problem 1
res<- data.frame(CX101,CX102,CX103,CX104,CX105)
row_names<- paste0("Student-",1:10)
rownames(res)<-row_names

# Problem 2
res_cleaned <- function(x){
  
  x[x>100]<- NA
  return(x)
  
}
res_clean <- apply(res,2,res_cleaned)
res_clean

#Problem 3


replaced_na <- function(x){
  x[is.na(x)] <- mean(x,na.rm = TRUE)
  return(x)
}

x<-replaced_na(res_clean)
x


res_updated <- apply(res_clean,2,replaced_na)
res_updated



