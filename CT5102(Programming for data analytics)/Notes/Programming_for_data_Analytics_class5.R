library(ggplot2)
mpg
ggplot(data=mpg, mapping= aes(x=displ, y=cty))


p1 <- ggplot(data=mpg, mapping= aes(x=displ, y=cty,colour=class,size=cyl))
p1
p1+geom_point()
p1+geom_point()+geom_smooth(method = "lm",SE=F)
p1+geom_point()+geom_smooth(method = "lm",se=F)


ggplot(mpg, aes(x=displ, y=cty)) + geom_point()

ggplot(mpg, aes(x=displ, y=cty)) + geom_point()+facet_wrap(~class)

ggplot(mpg, aes(x=displ, y=cty)) + geom_point()+facet_wrap(~manufacturer)

ggplot(mpg, aes(x=displ, y=cty, colour=class)) + geom_point()+facet_wrap(~manufacturer)

# Challenge 5.1

p1 <- ggplot(data=mpg,mapping = aes(x=displ,y=cty))+geom_point(aes(shape = drv , colour = class))
p1 <- p1+ labs(
  title = "Exploring the Relationship between displacement and city MPG",
  subtitle="With Car class and drive information",
  shape="Drive Type",
  colour="Class of Car",
  caption = "Based on the mpg dataset in ggplot2",
  x="Displacement",
  y="City Miles Per Gallon"
)
p1

?labs()

?ggplot()

?geom_point()


#--------------------------------
ggplot(data=mpg, mapping= aes(y=cty,x=manufacturer)) +geom_boxplot()+ 
  geom_hline(yintercept = mean(mpg$cty),colour="red")

