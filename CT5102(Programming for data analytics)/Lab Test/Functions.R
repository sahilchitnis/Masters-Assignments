#------
# Name:- Sahil Chitnis
# Student ID:- 23100637
#------

test <- c(1:10,NA,12:20)
test

# Question 1

v_sum <- function(x){
  
  result <- list(
              Size = length(x),
              Min = min(x,na.rm = T),
              Max = max(x,na.rm = T),
              Mean = mean(x,na.rm=T),
              NAs=sum(is.na(x))
              )
  return(result)
}

res <- v_sum(test)
str(res)



