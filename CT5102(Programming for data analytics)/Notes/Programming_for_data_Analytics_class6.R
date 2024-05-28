library(dplyr)
library(ggplot2)

mpg1 <- filter(mpg,class=="2seater",hwy>=25)
mpg1

mpg %>% arrange(cty) %>% slice(1:3)
#------------------------------------------
library(nycflights13)
flights

my_flights <- filter(flights,complete.cases(flights))
my_flights

glimpse(my_flights)

set.seed(100)

my_flights_f <- sample_frac(my_flights,size = 0.10)
my_flights_f


p1 <- ggplot(data=my_flights_f, mapping= aes(x=dep_delay,y=arr_delay,colour=month)) +geom_point()+
    facet_wrap(~carrier)
p1

ldd <- my_flights_f %>% arrange(desc(dep_delay)) %>% select(origin,carrier,dep_delay,everything())
ldd
