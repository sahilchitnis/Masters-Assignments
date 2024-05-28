names(mtcars)
length(mtcars[["mpg"]])

#Problem 1
my_list<-list()
conv_df_to_list<- function(Formaldehyde){
  for(i in 1:6){
    my_list[[i]]<-as.list(Formaldehyde[i,])
  }
  return(my_list)
}

c_1<- conv_df_to_list(Formaldehyde)
names(c_1)<-paste0("R-",1:6)
str(c_1)


#Problem 2
mtcars1<-head(mtcars)
mtcars1

my_list2<-list()
conv_df_to_list2<- function(mtcars1){
  for(i in 1:6){
    my_list2[[i]]<-as.list(mtcars1[i,])
    
  }
  return(my_list2)
}

c_2<- conv_df_to_list2(mtcars1)
names(c_2)<-paste0("R-",1:6)
str(c_2)