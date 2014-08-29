# Lecture 2 Examples
# 
# Author: Yiwen Zhang
#
# Date: Aug 28th 2014
###############################################################################

##====================================##
## Input variables 
##====================================##

##--------------------------------------
## Numeric
##--------------------------------------

x <- 1

a <- function(x){
  y <- x+1
  return( y )
}


a(x)

##--------------------------------------
## Character
##--------------------------------------

a <- "you are awesome!"

b <- function(x){
  x <- strsplit(x, split=" ")
  for(i in x){
    print(i)
  }
}

b(a)

##--------------------------------------
## Anything
##--------------------------------------

c <- function(fun){
  x <- 1:100
  y <- rnorm(100)
  
  out <- fun(y~x)
  
}

c(lm)


##====================================##
## Output variables 
##====================================##


c <- function(fun=lm){
  x <- 1:100
  y <- rnorm(100)
  
  out <- fun(y~0+x)
  
  return(data.frame(x=x, coef=coef(out)))
}

c()
.Last.value


y <- c()
head(y)


##====================================##
## Environment
##====================================##
environment()

rm(list=ls())
##--------------------------------------
## Example 1
##--------------------------------------
fun <- function(x){
	print(environment())
	print(paste("x=", x, sep=""))
	z <- 3
	print(paste("z=", z, sep=""))
	return(z)
}

out.z <- fun(x=1)

z

x

out.z


##--------------------------------------
## Example 2: a minor change
##--------------------------------------
rm(list=ls())

z

fun <- function(x){
	print(environment())
	print(paste("x=", x, sep=""))
	print(paste("z=", z, sep=""))
	return(z)
}
out1 <-fun(x=1)

z <- 1
out1 <- fun(x=1)

out1

## Note: The function will take values from the global environment
## when it can not find it from inside the function



##--------------------------------------
## Example 3: function inside function
##--------------------------------------
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
	return(insidefun(a, b))
}


out2 <- fun2(1, 2, 3)

out2

## Note: Function inside function, it will try to find the missing
## variable in the upper level envrionment


##--------------------------------------
## Example 4: a bad example
##--------------------------------------
rm(list=ls())

insidefun <- function(a,b){
	out <- a+b+z
	print(paste("out=",out, sep=""))
	return(out)	
}

fun3 <- function(x, a, b){

	print("In fun3:")
	print(paste("x=", x, sep=""))
	z <- 3
	print(paste("z=", z, sep=""))

	print("In fun3")
  output <- insidefun(a, b)
	return(output)
}

out3 <-  fun3(1, 2, 3)

out3

z <- 1
out3 <-  fun3(1, 2, 3)

out3

##====================================##
## Default variables
##====================================##

def.fun <- function(x=1){
	print(environment())
	print(paste("x=", x, sep=""))
	z <- 3
	print(paste("z=", z, sep=""))
	return(z)
}

def.fun(x=2)


##====================================##
## Extra variables
##====================================##

rm(list=ls())

c <- function(fun=glm, ...){

  x <- matrix(1:100, 100, 2)
  y <- rnorm(100)  
  out <- fun(y~0+x, ...)

  return(out)
  
}
y <- c(epsilon=1e-5)
head(y)


##--------------------------------------
## ggplot example
##--------------------------------------
require(ggplot2)


extra <- function(xlab='x', ylab='y', title='title', size=3, plot=plot){
  
  output <- plot + geom_point(size=size) + 
    xlab(label=xlab) + 
    ylab(label=ylab) + 
    ggtitle(label=title)
  
  return(output)
}


pltFun <- function(df, ...){

  opts <-list(...)
  plot <- ggplot(df, aes(x=x, y=y, color=c, fill=c)) 
  opts$plot <- plot
  output <-  do.call('extra', opts) + theme_bw()
  return(output)
}

df <- data.frame(x = rnorm(100), y = rnorm(100), c = rbinom(100, 1, 0.8))

pltFun(df, size=8, title='a')


##====================================##
## Vectorize
##====================================##

##--------------------------------------
## Example 1, apply
##--------------------------------------

x <- matrix(1, 2, 5)
apply(x, 2, mean)


x <- matrix(rnorm(20), 4,5 )

fun <- function(x){c(mean(x), var(x), min(x))}

apply(x, 1, 
      function(x){
        c(mean(x), var(x))
      }
      )



##====================================##
## Profile your code
##====================================##


require(MGLM)
## Sparse regression
set.seed(345)
n <- 200
d <- 4
p <- 30
beta <- matrix(0, p, d)
beta[c(1,3,5), -d] <- 0.1
X <- matrix(rnorm(n*p),n, p)
Alpha <- exp(X%*%beta)
m <- rbinom(n, 80, 0.5)
Y <- rmn(m, Alpha)
ngridpt <- 10


source('Examples/CodingStyle.R')
select <- MGLMsparsereg(Y~0+X, dist="MN", penalty="group", lambda=3)


##--------------------------------------
## Example 1, time
##--------------------------------------
Rprof(filename='Rprof.out')
select <- MGLMsparsereg(Y~0+X, dist="MN", penalty="group", lambda=3)
Rprof(NULL)

summaryRprof('Rprof.out')


##--------------------------------------
## Example 2, time + memory
##--------------------------------------
Rprof(filename='Rprof.out', memory.profiling=TRUE)
select <- MGLMsparsereg(Y~0+X, dist="MN", penalty="group", lambda=3)
Rprof(NULL)

summaryRprof('Rprof.out', memory='both')

