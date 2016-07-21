##################################################
## Data scientists family group
## R Tutorial - Data exploration
## Rodrigo Donoso - Vicente Figueroa - Max Rivera
##
##################################################

# This file contains some basic information about R - Data exploration

#################################
# 1. Getting Started - Comments #
#################################
# download R from: http://www.r-project.org/
# R is a scripting language, no compiling necessary
# R is case sensitive
# R requires no semi-colons and ignores whitespace, though you can write multiple 
# commands on a line and separate them by semi-colons
# R has file extension .R, but you can feed in text
# R has some missing data values, NA and NULL
# read more here: http://www.r-bloggers.com/r-na-vs-null/
#### hash/pound signs comment out a line
# if you enter an unfinished command into an R line
# (e.g. you forget a parenth), R goes to the next line
# and starts it with a +

#####################################
# 2. Setting your working directory #
#####################################
# All file path names need to use the forward slash / (as in Unix) not the windows backward slash \.

# For example to set wd to my desktop folder named "R_Codes"

# Long version 
setwd("C:/Users/RodrigoDonoso/Desktop/R_Codes")

# Short version (same as long version)
setwd("~/Desktop/Escuelas Mex R/R_Codes")

# to find my working directory
getwd()

# lists everything stored in the R workspace
ls()

# clears the workspace: THIS IS VERY IMPORTANT
rm(list=ls())
ls()

#################
# 3. Help in R: #                    
#################
# if you eveer need help about something type:

# ?something search for help file among installed packages
?mean

# Example
help(sum)
? (sum) #both are the same


################
# 4. Packages  #
################
# There are tons of packages containing functions that people have written for R
# to download a package type:
# install.packages("package.name")
install.packages("robustbase")

# to use a package you must load it either with:
# library(package.name)
# require(package.name)

# require() should be used if calling inside a clause
# require() returns a logical value by default
# TRUE if the package is loaded FALSE if not

require(robustbase)
test <- require(ggplot2)
test2 <- require(abcde)

########################
# 5. R as a calculator #
########################
2+3

2+3*4

########################
# 5. Variable Creation #
########################
# <- is used for creating variables and functions
x <- 2
x
y <- 3
y
z <- 4
z

# you can also use = 

z = 2
z

x+y*z

result <- x+y*z
result 

# Everything given a name is an object and is stored in the workspace
ls()

#######################
# 6. Creating vectors #
#######################
x <- 1:5
x

y <- 11:15
y

# use c() to make a vector containing anything
z <- c(10,6,3,5,1)
z

# if one entry is a string, all entries become strings
zz <- c("blah", 2, 5)
zz

#######################
# 7. indexing vectors #
#######################
# indices start at 1, not 0!

y[2]

z[4]

y[2:4]

z[c(5, 1, 2)]

#####################
# 8. seq() function #
#####################
?seq
help(seq)

a <- seq(10,20)
a

a <- seq(20,10)
a

b <- seq(from=17,to=30,by=2)
b

b <- seq(17,30,2)
b

b <- seq(by=2,to=30,from=17)
b

c <- seq(2,1,-.1)
c


###########################
# 9. functions on vectors #
###########################
vec <- c(10,5,1,12,4)
vec

vec^2

vec + vec

sum(vec)

mean(vec)

sum(vec)/length(vec)

vec2 <- c(vec,10,10,4)
vec2

# Counting things in vectors: use comparison operators (==, <, >, <=, >=, !=),
# boolean operators ( |, & )and sum() function

vec2 == 1

sum(vec2 == 1)

vec2 == 10

# trues are encoded as 1 and false as 0 

# this returns the number of entries equal to 10
sum(vec2 == 10)

sum(vec2 < 10)

sum(vec2 <= 10)

# | is or 

vec2 == 10 | vec2 == 1

vec2

sum(vec2 == 10 | vec2 == 1)

vec2 > 1 & vec2 < 12


###############################################################
# 10. Creating arrays (matrices) by using the matrix function #
###############################################################
?matrix
x <- matrix(1:12,nrow=3)
x

dim(x)
dim(x)[1] # number of rows
dim(x)[2] # number of cols

length(x) # array is a vector

y <- matrix(1:12,nrow=4)
y
dim(y)

z <- matrix(1:12,nrow=3,byrow=T)
z

temp <- c(5,10,12,24,42,60,63,72)
w <- matrix(temp,ncol=2)
w
dim(w)

##########################
# 11. indexing in arrays #
##########################
w[4,2]

w[1,2]

z[3,3]

z

z[1:2, 1:2]

z[,1]

z[1,]

# Calculating row and column means

colMeans(z)
rowMeans(z)
colSums(z)/dim(z)[1]
rowSums(z)/dim(z)[2]

#################
## 12. Subsets ##
#################

z

## subset function selecting rows by condition
?subset
subset(z, z[,1] < 9)
subset(z, z[,1] < 9 & z[,1] > 1)

## subset function selecting columns

subset(z, select = 1)
subset(z, select = c(1, 2))

## Alternative method

z[z[,1] < 9,]
z[, z[1,] < 3]
z[, c(1, 2)]
z[z[,1] < 9, z[1,] < 3]

# which function returns index when argument is true

x <- c(1, 2, 5, 3, 6)

which(x == 3, x)

## from above

z[z[,1] < 9, ]

## can be done also

condition <- which(z[,1] < 9)
z[condition,]

## another useful which

which.max(x)
x[5]

###############
## 13. Lists ##
###############

## Lists are also useful. They can store objects as well as values

z <- list(1, 2, 3)
z

# you can unlist them as

z <- unlist(z)
z

a = c(1, 2, 3, 5, 6)
b = c(45,3, 5, 2, 1)
c = c(2, 59, 381, 60)

z <- list(summary(a), summary(b), summary(c))
z

## to access a particular entry you must use two sets of square brackets

z[[2]]


# you can access entries within the list:

z[[2]][2]

########################
# 14. making functions #
########################

fun1 <- function(vec){
  mean <- mean(vec)
  sd <- sd(vec)
  min <- min(vec)
  max <- max(vec)
  
  return(c(mean, sd, min, max))
  
}

a <- 1:4

fun1(a)

###############
# 15. clauses #
###############

for(i in 1:length(a)) {
  cat(a[i], "\n")
}

## lists and vectors can be created without
## defining length. This can be useful with loops

y <- c()
y
z <- list()
z

for( i in 1:10){
  y[i] <- i^2
  z[[i]] <- summary(1:i)
}

y
z

if(length(a)>2){
  cat("the length of vector a is greater than 2")
}

##########################
# 16. Data import/export #
##########################
# You can read in text files, csv files.

# Reading in data from a text file using the read.table function.  
# Note I�m reading this as a local file in the same directory as my R session (.RData file).  
# A full path name will also work, but you need to use front slashes (as in Unix) 
# not back slashes (as in Windows). R can also read web address path names.

?read.table
?read.csv

#REMEMBER TO HAVE CSV ASPIRIN IN THE SAME WORKING DIRECTORY

data <- read.csv("aspirin.csv", header=T)

head(data)
tail(data)
summary(data)


# rename the columns
names1 <- names(data)
names1
names2 <- c("a", "b", "c")
names(data) <- names2
names(data)
head(data)

colnames(data) <- names1

data[1:10,]

dim(data)

nrow(data)

ncol(data)

data[1,1]

data[8,3]

typeof(data)
class(data)
class(data$subject)
class(data$before)


####################
# 17. writing data #
####################
?write.table() #in three different formats
write.table(data, file="writetest1.dat")
write.table(example.data, file="writetest2.txt")
write.table(example.data, file="writetest3.csv")


#######################
# easy visualizations #
#######################
# make histograms

?hist
hist(data$x1)
hist(data$y)

# make scatterplots
?plot
plot(data$before,data$after) 


# make boxplot
?boxplot
boxplot(data$after~data$sex,
        main = "After by sex",
        xlab = "sex",
        ylab = "number")


