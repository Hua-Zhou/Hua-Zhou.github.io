# sweep.r           Demonstration of sweep operator 
#                     for regression computations 
#                   
#
# clean up workspace
rm(list=ls())
# define function (as in KL 7.4)
regsweep <- function(A,k,inv=FALSE) {
  d <- A[k,k]               # sweep out row k, col k
  A[k,] <- A[k,]/d
  b <- A[,k]
  b[k] <- 0                 # don't change row k here
  A <- A - outer(b,A[k,])   # main operation
  A[,k] <- b/d              # fix col k
  A[k,k] <- -1/d            # diagonal element & done
  if (inv) {                # inverse sweep
    A[k,] = - A[k,]
    A[,k] = - A[,k]
  }
  regsweep <- A     
}
#
# read the Longley data
#
all <- read.table("http://hua-zhou.github.io/teaching/st758-2013fall/longley.dat")
Xy <- cbind(rep(1,16),as.matrix(all[,c(2,3,4,5,6,7,1)])) # X and y
colnames(Xy) <- c("X0", "X1", "X2", "X3", "X4", "X5", "X6", "Y")
Xy
# inner product matrix
yXXy <- t(Xy) %*% Xy
yXXy
# sweep in 1:7
for ( k in c(1:7) ) {
  yXXy <- regsweep(yXXy,k)
}
# reg coeff, s.e., and SSE appear
print(yXXy)
# then invere sweep out 1:7
for ( k in c(1:7) ) {
  yXXy <- regsweep(yXXy,k,inv=TRUE)
}
# last tableau should be (save rounding) same as first
print(yXXy)
# clean and close
rm(list=ls())
