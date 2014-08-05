
########################################################################
## Function Basics
########################################################################

##--------------------------------------------------
## Input arguement
##--------------------------------------------------

## Example 1
fun1 <- function(x){
  y <- 2*x+1
  return(y)
}

out <- fun1(1)
out <- fun1(matrix(1:8, 4,2)) 

## Example 2
fun2 <- function(x){
  a <- paste(x, "is easy!", sep=" ")
  return(a)
}

x <- "Writing function"
fun2(x)

x2 <- c("Writing function", "Using R", "Learning stat")
fun2(x2)


## Retrieve the un-saved value
crazy.sample <- .Last.value


##--------------------------------------------------
## Output arguement
##--------------------------------------------------

## Example
estFun <- function(x){
  mean <- mean(x)
  var <- var(x)
  out <- c(mean, var)
  names(out) <-c("mean", "var")
  return(out)
}

vector <- seq(0, 100, by=2)
out <- estFun(vector)
out

##-------------------------
## Namespace
##-------------------------

## Example 1

rm(list=ls())
x <- rnorm(10)
y <- runif(10)

lm(y~x)

lm <- function(x, y){
  return(sum(x+y))
}
lm(x, y)


##--------------------------------------------------
## Save R function
##--------------------------------------------------

source("practice.R")

save(fun1, fun2, "functions.RData")

attach("functions.RData")
load("functions.RData")



########################################################################
## Function Scope
########################################################################

fun <- function(x){
  print(environment())
  print(paste("x=", x, sep=""))
  z <- 3
  print(paste("z=", z, sep=""))
  return(z)
}

out.z <- fun(1)

z

x

out.z

##--------------------------------------------------
## Function within function 
##--------------------------------------------------
rm(list=ls())

z

fun2 <- function(x, a, b){
  print("In fun2:")
  print(environment())
  print(paste("x=", x, sep=""))
  z <- 3
  print(paste("z=", z, sep=""))
  insidefun <- function(a,b){
    print("In insidefun")
    print(environment())
    out <- a+b+z
    print(paste("out=",out, sep=""))
    return(out)	
  }
  
 print("In fun2")
 print(environment())
  out <- insidefun(a, b)
  return(out)
}


out2 <- fun2(1, 2, 3)

out2

########################################################################
## Vectorize your code
########################################################################

##--------------------------------------------------
## apply, lapply, sapply
##--------------------------------------------------

## Example 1
aM <- matrix(seq(1, 1000, length=40), 5, 8)

# output vector of length 1
apply(aM, 1, prod)

# output of a vector of length 5
apply(aM, 1, stats::quantile)

# output of a vector of length 8*5
apply(aM, 1, outer, rep(1,5))


apply(aM, 1, function(x) sum(gamma(x+1)))


myGamma <- function(x){
  gx <- ifelse(gamma(x)==Inf, NA, gamma(x))
  return(sum(gx))
}

apply(aM, 1, myGamma)

## Example 2
rm(list=ls())

students <- read.table("StudentNames.txt", header=FALSE, sep="\t")
students <- students$V1
head(students)

system.time(
  for(i in 1:1000){
    last <- sapply(students, function(x) strsplit(as.character(x), split=" ")[[1]][2])
})

## Example 3
a <- matrix(1:1e5, , 100)
b <- matrix(rep(1, 2e5), ,200)

system.time(
out <- sapply(1:nrow(a), function(i, A, B) return(A[i,]%x%B[i,]), a, b)
)

##--------------------------------------------------
## Vectorize
##--------------------------------------------------

## Example 2
vsplit <- Vectorize(function(x) 
  return(strsplit(as.character(x), split=" ")[[1]][2]), vectorize.args="x")
system.time(
  for(i in 1:1000){
    last2 <- vsplit(students)
  }
)

system.time(
  for(i in 1:1000){
    last3 <- rep(NA, length(students))
    m <- 0
    for(i in students){
      m+1
      last3[m] <- strsplit(as.character(i), split=" ")[[1]][2]
    }
  }  
)

## Example 3
vout <- Vectorize(function(i, A, B) return(A[i,]%x%B[i,]), vectorize.args="i")

system.time(
out2 <- vout(1:nrow(a), a, b)
)

## a and b are vectors a%*%b is the same as c(t(a%o%b))

out3 <- matrix(NA, nrow(out2), ncol(out2))
system.time(
  for(i in 1:nrow(a)) {
    out3[,i] <- a[i, ]%x%b[i,]
  } 
)


##--------------------------------------------------
## plyr and dplyr
##--------------------------------------------------

require(plyr)

str(mtcars)

outDf <- ddply(mtcars, .(gear), summarise, mean=mean(mpg))

# devtools::install_github("assertthat")
# devtools::install_github("dplyr")
# require(dplyr)
# gDf <- group_by(mcars, gear, carb)
# sDf <- summarise(gDf, mean())


########################################################################
## Compiled R code
########################################################################
## Example 3
a <- matrix(1:1e5, , 100)
b <- matrix(rep(1, 2e5), ,200)

system.time(
  out <- sapply(1:nrow(a), function(i, A, B) return(A[i,]%x%B[i,]), a, b)
)

## Compiled version
fun <- function(){
  out3 <- matrix(NA, nrow(out), ncol(out))
  for(i in 1:nrow(a)) {
    out3[,i] <- a[i, ]%x%b[i,]
  } 
  return(out3)
}

require(compiler)
cfun <- cmpfun(fun)

system.time(
  out4 <- cfun()  
)

## Compile file
cmpfile("practice.R", "cmpPractice.Rc")
loadcmp("cmpPractice.Rc")



########################################################################
## Parallel example function
########################################################################
compare.tests <- function (n.pattern, sigma2.ratio, level = 0.05, null.size = 200000, mc.size = 10000)

compare.tests.all <- function (n.pattern.list, sigma2.ratio.list,level = 0.05, null.size = 200000, mc.size = 10000){
  m1 <- length (n.pattern.list)
  m2 <- length (sigma2.ratio.list)
  power<-mcnemar<-matrix(0, m1*3, m2*2)
  for (i1 in 1 : m1) {
    index1 <- 3 * (i1 - 1) + (1 : 3)
    for (i2 in 1 : m2) {
      index2 <- 2*(i2 - 1) + (1 : 2)
      result <-compare.tests (n.pattern.list[[i1]],sigma2.ratio.list[[i2]],level, null.size, mc.size)
      power[index1,index2]<-result$power
      mcnemar[index1,index2]<-result$mcnemar
    }
  }
  list (power = power, mcnemar = mcnemar)
}





# library(rbenchmark)
# require(plyr)
# benchmark(ddply, lapply, tapply, sapply,
#           replications = 1000000, 
#           columns = c("test", "elapsed", "relative"),
#           order = "elapsed")
