library(dplyr)
library(aimsir17)
tx <- tibble(key=c(1,2,3,2), val_x=c("x1","x2","x3","x3"))
ty <- tibble(key=c(1,2,3,5), val_y=c("y1","y2","y3","y3"))

tx

ty

#keep will keep the copy of all the columns in the table, all keys from both inputs are retained.

ij <- inner_join(tx,ty,by="key",keep=T)
ij


?inner_join()

left_join(tx,ty,by="key")

right_join(tx,ty,by="key")

full_join(tx,ty)

glimpse(observations)

glimpse(stations)

#get the station information 

obs_station <- left_join(observations,stations,by="station")
obs_station
glimpse(obs_station)


library(ggplot2)
library(dplyr)
library(aimsir17)
glimpse(eirgrid17)


ener <- eirgrid17 %>% select(month:date,IEWindGeneration) %>% rename(WGen=IEWindGeneration)
ener

ener_g <- ener %>% group_by(month,day,hour) %>% summarise(AWGen=mean(WGen)) %>% ungroup()
ener_g


oct_2017 <- observations %>% filter(station=="MACE HEAD",month==10) %>% select(month,day,hour,wdsp)
oct_2017


result <- 

slice(ener_g,1)








