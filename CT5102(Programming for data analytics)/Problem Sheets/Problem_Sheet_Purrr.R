library(purrr)
library(ggplot2)
library(dplyr)
library(aimsir17)
library(gapminder)
library(repurrrsive)
library(tidyr)
library(lubridate)

x <- list(a=1:10,b=11:20,c=21:30)
x
map(x,min)
map_dbl(x,min) #returns a vector

addTen <- function(.x){
  
  cat("Calling addTen with .x=",.x,"\n")
  .x + 10
}

map(.x=c(1,4,7),
    .f=addTen)

mpg %>% subset(select=c(cty,hwy,displ)) %>% map(mean)  #This will return a list as map always returns a list

mpg %>% subset(select=c(cty,hwy,displ)) %>% map_dbl(mean) # This will return a atomic vector.

map(c(1,4,7),function(.x).x+10) #Here we are calling an anonymous function and passing to the map function.

map_df(c(1,4,7),function(.x){
  tibble(Old=.x, New=.x+10)})

observations %>% map_dbl(~{.x
  sum(is.na(.x))
})

observations %>% map_dbl(~{.
  sum(is.na(.))
})


gapminder %>%  map(n_distinct)

gapminder %>% map_df(~(tibble(n_distinct=n_distinct(.x),
                          class=class(.x))))


mpg %>% distinct(class)


# Problem Sheet

# Problem 1
swv_df <- sw_vehicles %>% keep(~.x$length!="unknown") %>% map_df(~tibble(Name= .x$name,
                                                                 Model=.x$model,
                                                                 Length=as.numeric(.x$length))) %>% 
        arrange(desc(Length)) %>% head()
swv_df

# Problem 2

set.seed(1000)
params <- list(
  list(n=3,mean=10,sd=2),
  list(n=4,min=10,max=15),
  list(n=5,min=0,max=1)
)
f <- c("rnorm","runif","runif")
res <- invoke_map(f,params)
str(res)


#Problem 3

d_sum <- observations %>% filter(complete.cases(observations)) %>% group_by(station,month,day) %>% 
  summarise(TotalRain=sum(rain,na.rm = TRUE),
            AvrMsl=mean(msl,na.rm = TRUE)) %>% ungroup()


cors <- d_sum %>% group_by(station) %>% group_split() %>% map_df(~tibble(
        Station= first(.x$station), 
        Corr=cor(.x$TotalRain,.x$AvrMsl)
)) %>% arrange(Corr) %>% head()
cors

#Problem 4

# Without the pluck function
my_map_dbl1 <- function(x,f){
  
  out <- vector(mode="list",length = length(x))
  for (i in seq_along(x)) {
    out[[i]] <- f(x[[i]])
    
    
  }
  unlist(out)
}
my_map_dbl1(1:3,function(x)x+10)

# With pluck function.It implements a generalised form of [[ that allow you to index deeply 
# and flexibly into data structures
my_map_dbl2 <- function(x,f){
  
  out <- vector(mode="list",length = length(x))
  for (i in seq_along(x)) {
    out[[i]] <- f(pluck(x,i))
    
    
  }
  unlist(out)
}
my_map_dbl2(1:3,function(x)x+10)

#Problem 5

e17 <- eirgrid17 %>% dplyr::select(date,month,day,hour,IEDemand) %>% group_by(month,day)%>% 
  summarise(Date=first(date),
  Day=wday(Date,label=T,abbr=T),
  AvrDemand=mean(IEDemand,na.rm = TRUE)) %>% ungroup()

e17_n <- e17 %>% group_by(Day) %>% nest()
e17_n <- e17_n %>% mutate(AvrDemand=map_dbl(data,~mean(.x$AvrDemand))) %>% arrange(desc(AvrDemand))
e17_n
