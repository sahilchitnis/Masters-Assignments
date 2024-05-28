library(ggplot2)
library(dplyr)
library(aimsir17)
library(GGally)

# Problem 1



filtered_data <- observations %>% select(station,date,wdsp) %>% filter(station %in% c("MACE HEAD", "DUBLIN AIRPORT"),
                                         date>="2017-02-22" & date<"2017-02-24")
ggplot(data=filtered_data,mapping = aes(x=date,y=wdsp,colour=station)) +geom_point() +geom_line() +
theme(legend.position="top")  + labs(x="Time",
                                      y="Windspeed",
                                      title = "Wind Speed Plot",
                                     subtitle = "February 2017")

# Problem 2
top5 <- observations %>% select(station:msl) %>%  arrange(desc(rain)) %>% slice(5:1)
top5

# Problem 3

temp21 <- observations %>% filter(station %in% c("PHOENIX PARK", "VALENTIA OBSERVATORY"), month==6, day==21) %>% 
  select(hour,station,temp) %>% arrange(hour)
temp21

# Problem 4

temp21 <- observations %>%
  filter(month == 6, day == 21, station %in% c("PHOENIX PARK", "VALENTIA OBSERVATORY")) %>%
  select(hour, station, temp) %>%
  arrange(hour) %>%
  group_by(station) %>%
  mutate(DailyMaxTempS=max(temp,na.rm=T),
         DiffDailyMax=temp-DailyMaxTempS)

temp21 <- ggplot(temp21, aes(x=hour,y=DiffDailyMax,colour=station))+geom_point()+geom_line()+
  geom_hline(yintercept = max(temp21$DiffDailyMax))
temp21 + theme_void() + theme(legend.position="bottom")


#Problem 5


annual_rain <- observations %>% filter(station %in% c("DUBLIN AIRPORT","NEWPORT")) %>%
  group_by(station, hour) %>% summarize(total_rainfall = sum(rain, na.rm = TRUE))

ggplot(annual_rain, aes(x = hour, y = total_rainfall, fill = station)) +
  geom_col(position = "dodge") +
  labs(x = "hour",
       y = "TotalRain",
       fill = "Weather Station")  + theme(legend.position="top")
