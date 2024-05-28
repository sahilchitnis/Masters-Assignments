#------
# Name:- Sahil Chitnis
# Student ID:- 23100637
#------

l <- list(a=1:10,
          b=rep(c(T,F),5),
          c=list(d=2:4,
                 e="Hello"))
l

# Question 1 
l1 <- l[c("a","b")]
str(l1)


# Question 2
v1 <- c(l[["b"]])
v1

# Question 3

v2 <- l$c$e[[1]]
v2

# Question 4

name_change_List <- LETTERS[1:3]

names(l) <- name_change_List

str(l)


