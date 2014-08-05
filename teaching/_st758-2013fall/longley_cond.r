# condition_longley.r         
#
# simple demo of condition number of the Longley data
#
#
# clean up workspace
#
rm(list=ls())
#
# read the Longley data
#
all <- read.table("http://hua-zhou.github.io/teaching/st758-2013fall/longley.dat")
X <- cbind( 1, as.matrix(all[,c(2,3,4,5,6,7)]) )
colnames(X) <- c("X0", "X1", "X2", "X3", "X4", "X5", "X6")
X
#
# condition number of the design matrix
#
X.svd <- svd(X)
X.cond <- max(X.svd$d) / min(X.svd$d)
X.cond
#
# let's center and scale the predictors except intercept
#
Xs <- cbind( 1, scale(X[,-1], center=TRUE, scale=TRUE) )
Xs.svd <- svd(Xs)
Xs.cond <- max(Xs.svd$d) / min(Xs.svd$d)
Xs.cond
#
# condition of the Gramian matrix
#
xtx <- t(Xs) %*% Xs
xtx.svd <- svd(xtx)
xtx.cond <- max(xtx.svd$d) / min(xtx.svd$d)
xtx.cond

# clean and close
rm(list=ls())
