mod <- lm(mpg~disp,data=mtcars)
summary(mod)
summary.lm


summary.lm <- function(o)cat("hello world")
summary(mod)



x <- 1:5
attr(x,"namess") <- LETTERS[1:5]
x

y <- matrix(1:8,nrow = 2)
y
attributes(y)

attr(y,"dim") <- c(4,2)
y



test_df <- subset(mtcars,select = c(disp,mpg)) |> head()
test_df
class(test_df) <- "data..frame"
class(test_df)
test_df
str(test_df)
pm <- methods(print)
pm

class(test_df) <- "data.frame"
test_df


