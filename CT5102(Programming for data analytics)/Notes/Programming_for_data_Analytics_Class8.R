library(ggplot2)
library(dplyr)
library(purrr)

mpg


result <- mpg %>% select(cty,hwy,displ) %>% map(mean)
result

res2 <- mpg %>% select(cty,hwy,displ) %>% map(function(x){
                                          browser()
                                          mean(x)})
res2

res3 <- mpg %>% select(cty,hwy,displ) %>% map_dbl(function(x){
  mean(x)})
res3


res4 <- mpg %>% select(cty,hwy,displ) %>% map_chr(function(x){
  mean(x)})
res4

res5 <- mpg %>% select(cty,hwy,displ) %>% map_dbl(~{
                                                browser()
                                              mean(.)})
res5

#-------------------------------------------------------------------------------
library(repurrrsive)
View(sw_films)


sw_t <- sw_films %>% map_df(function(y)
                            tibble(Episode_Id= y$episode_id,
                                  Title= y$title,
                                   Director= y$director,
                                   Date=as.Date( y$release_date)))
sw_t

mpg_l <- mpg %>% group_by(class) %>% group_split() %>% 
                                                  map_df(~{
                                                    mod <- lm(cty~displ,data=.)
                                                    Intercept <- coef(mod)[1]
                                                    slope <- coef(mod)[2]
                                                    tibble(Class=first(.$class),
                                                           N0bs=nrow(.),
                                                           Intercept=Intercept,
                                                           slope=slope)
                                                    
                                                  })
mpg_l


