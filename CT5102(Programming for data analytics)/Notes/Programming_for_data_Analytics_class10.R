mpg
class(mpg)
head(mpg)
attributes(mpg)
attr(mpg,"class") <- "data.frame"
class(mpg) <- class(ggplot2::mpg)
head(mpg)
plot
m <- summary(mpg)
m <- lm(hwy~displ,data=mpg)

summary(m)
#=============================================

library(ggplot2)
library(glue)

source("code")


update_mod <- function(x){
  class(x) <- c("my_lm",class(x))
}


plot.lm <- function(x){
  
  
  p1 <- ggplot(x$model,aes(x=x$model[[2]],y=x$model[[1]]))+geom_point()+ geom_abline(slope=x$coefficient[2],
                                                                                     intercept = x$coefficient[1],
                                                                                     colour="red" 
                                                                                     )+ geom_jitter()
  p1
}

methods("plot")


mod <- lm(hwy~displ,data=mpg)
class(mod)

umod <- update_mod(mod)
class(umod)



coef(umod)
plot(mod)
plot(umod)


