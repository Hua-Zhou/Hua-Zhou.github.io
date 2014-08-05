# condition.r         Demo for condition number
#                   September 2007, revised September 2012
#
# simpler example for condition number for solving systems
#  of linear equations
#
# here's a matrix
A <- matrix(c(4,-2,2,4,-2,2,-2,-2,2,-2,11,5,4,-2,5,6),4,4)
A                               # write it out
#
# Cholesky factorization
#
Lt <- chol(A)
Lt                              # write it out
#
# rhs
#
b <- c(2,0,0,2)
#
# solve these equations
#
y <- forwardsolve( t(Lt), b)
x <- backsolve( Lt, y )
x                               # write it out
#
# check the solution
#
A %*% x
#
# get p=1 norm (from homework exercise)
#
normA <- max( colSums(abs(A)) )
normA
#
# get p=1 norm of inverse for condition number
#
kappa <- normA*max( colSums(abs(chol2inv(Lt))) )
kappa
#
# small change in matrix A
#
E <- matrix( 1.e-4, 4, 4)   # recycling
#
# Cholesky factor of changed matrix
#
Lte <- chol( A+E )
Lte
#
# solve equations
#
y <- forwardsolve(t(Lte),b)
xe <- backsolve(Lte,y)
xe
#
# norm of difference in solution
# 
sum( abs(x-xe) ) 
#
# relative change in solution
#
sum(abs(x-xe)) / sum(abs(x))
#
#
# small change in rhs
#
be <- b + 1.e-4             # recycling
#
# solve equations
#
y <- forwardsolve(t(Lt),be)
xe <- backsolve(Lt,y)
xe
#
# norm of difference
# 
sum( abs(x-xe) ) 
#
# relative change in solution
#
sum(abs(x-xe)) / sum(abs(x))
#
# relative change in rhs
#
(4*1.0e-4) / sum(abs(b))
#
# done
rm(list=ls())

