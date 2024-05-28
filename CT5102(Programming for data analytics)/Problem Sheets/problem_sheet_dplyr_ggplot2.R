# Problem 1
library(ggplot2)

str(mpg)
p1 <- ggplot(data=mpg,mapping = aes(x=displ,y=cty))+geom_point(aes(shape = drv , colour = class))
p1 <- p1+ labs(
              title = "Exploring the Relationship between displacement and city MPG",
              subtitle="With Car class and drive information",
              shape="Drive Type",
              colour="Class of Car",
              caption = "Based on the mpg dataset in ggplot2",
              x="Displacement",
              y="City Miles Per Gallon"
) + theme(plot.title = element_text(face = "bold"),plot.subtitle = element_text(face="italic")) 
p1

#-------------------------------------------------------------------------------
# Problem 2
library(aimsir17)
library(GGally)

rp_10 <- observations %>% subset(station=="ROCHES POINT" & month==10,
                                 select=c(rain,wdsp,temp,msl))

p2 <- ggpairs(rp_10,progress = F) + labs(title = "Exploring relationships between Irish weather variables",
                                         subtitle="Rainfall, Windspeed, Temperature and Mean Sea Level Pressure",
                                         caption="Roches Point, October 2017")
p2

p2 <- p2 + theme(plot.title = element_text(face="bold"),
                 plot.subtitle=element_text(face="italic"),
                 plot.caption = element_text(face="bold"))
p2
#-------------------------------------------------------------------------------
# Problem 3
temp2 <- observations %>%  subset(station %in% c("MALIN HEAD","DUBLIN AIRPORT","SherkinIsland"),
                                 select=c(station,month,temp))
temp2

converted_month <- factor(temp2$month)

temp3 <- ggplot(data=temp2, aes(x=converted_month,y=temp,colour=station))+
  geom_boxplot() + labs(
        title="Summarise of monthly temperature in 2017",
        subtitle="For stations Dublin Airport (E), Malin Head (N) and Sherkin Island (S)",
        x="Month of Year",
        y="Temperature",
        color="Weather Station"
  ) + theme(plot.title = element_text(face = "bold"),
            plot.subtitle = element_text(face="italic"),
            legend.position ="bottom" )
temp3
#-------------------------------------------------------------------------------

#dplyr

set.seed(100)

ans <- mpg %>% select(manufacturer,model,displ,year,cty,hwy,class) %>%
  filter(cty > median(cty)) %>% sample_n(5)
ans


#Problem 2
jan <- observations  %>% select(station, month, day, hour, date, temp)  %>%
  subset(station %in% c("DUBLIN AIRPORT","MACE HEAD") & month== 1) %>% 
  mutate(WeatherStatus=case_when( temp<=0 ~ "Warning - Freezing",
                                  temp>0 & temp<=4 ~ "Warning - Very Cold",
                                  temp>4 ~ "No Warning")) %>% arrange(date)

jan <- ggplot(data=jan,mapping = aes(x=date,y= temp)) + geom_point(aes(colour=WeatherStatus)) +
  theme(legend.position ="top") + scale_color_manual(values=c("green", "red", "orange"))
jan

#Problem 3

diam <- diamonds %>% group_by(cut) %>% summarise(NumberDiamonds = n(),
                                                 CaratMean = mean(carat),
                                                 PriceMax = max(price),
                                                 PriceMaxColour = color[which.max(price)]) %>% arrange(desc(diam))
diam

#Problem 4

mpg

mpg1 <- mpg %>% group_by(class) %>%select(manufacturer,model,displ,year,cty,class) %>% 
  mutate(RankCty=rank(cty,ties.method = "first"))  %>% arrange(class,cty) %>% ungroup()
mpg1

# Problem 5

a_temp <- observations %>% group_by(station) %>% summarise(AvrTemp=mean(temp,na.rm = TRUE)) %>% ungroup()
a_temp


temp_high <- a_temp %>% filter(AvrTemp==max(AvrTemp)) %>% select(station)
temp_high


temp_low <- a_temp %>% filter(AvrTemp==min(AvrTemp)) %>% select(station)
temp_low


m_temps <- observations %>% filter(station %in%  c(temp_high,temp_low)) %>% group_by(station,month) %>% 
            summarise(AvrTemp=mean(temp,na.rm = TRUE)) %>% ungroup()
m_temps

temp_low
temp_high


arrange(m_temps,month,station)

ggplot(m_temps,aes(x=month,y=AvrTemp,colour=station)) + geom_point() +geom_line() + 
  theme(legend.position="top") +
  scale_x_continuous(limits=c(1,12), breaks=seq(1,12)) +
  labs(x="Month",
       y="Average Temperature",
       title = "Monthly rainfall summarise calculated using dplyr")


