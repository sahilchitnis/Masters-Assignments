#==============================
#Name:- Sahil Chitnis MSc Data Analytics
#Student_ID:- 2300637
#==============================


library(aimsir17)
library(purrr)
library(dplyr)
library(ggplot2)
library(tidyr)

# Probem 1
a17 = observations %>% 
  filter(station %in% c("DUBLIN AIRPORT", "MACE HEAD", "VALENTIA OBSERVATORY"))
a17

a17 %>%
  select(station) %>%
  pull() %>%
  unique()

#Problem 2
a17 <- a17 %>%
  mutate(season = case_when(
    month %in% c(11, 12, 1) ~ "Winter",
    month %in% c(2, 3, 4) ~ "Spring",
    month %in% c(5, 6, 7) ~ "Summer",
    month %in% c(8, 9, 10) ~ "Autumn",
    TRUE ~ "Unknown"
  )) %>% select(station, season, date, wdsp, msl)

a17


#Problem 3
a17_n <- a17 %>% group_by(station,season) %>% nest()
a17_n


#problem 4

a17_n <-  a17_n %>% mutate(Correlation = map_dbl(data, ~{
  cor(.$wdsp, .$msl, use = "complete.obs")
})) %>% arrange(Correlation)
a17_n


#Problem 5

ggplot(a17_n,aes(x=station,y=abs(Correlation),fill=season))+
  geom_col(position="dodge")

