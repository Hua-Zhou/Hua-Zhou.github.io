# mxmult.r         common pitfall in matrix multiplication
#                  September 2008, revised September 2009
#
# clean up workspace
rm( list=ls() )
# slr design matrix X
X <- cbind( rep(1,6), (1:6) )
X
# weight vector w
w <- sqrt( (1:6) )          # just so they're different
w
# weight matrix
W <- diag(w)
# now (X'inv(W) X) four ways:
#   first          correct, but slow, W takes lots of space
W <- diag(w)
xwx1 <- t(X) %*% solve(W) %*% X      
xwx1
#   second         correct, less slow, takes lots of space 
xwx2 <- t(X) %*% diag(1/w) %*% X    
xwx2
#   third          wrong, but faster -- recycles w wrong
xwx3 <- ( t(X) / w ) %*% X           # *****wrong*****
xwx3
#   fourth         correct, but looks wrong
xwx4 <- t(X) %*% (X/w)               # uses recycling correctly, fast
xwx4
#                  looks different but same execution
crossprod(X,X/w)                     # correct, fast
# done
rm( list=ls() )
# q()