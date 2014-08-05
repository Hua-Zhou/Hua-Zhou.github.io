# weird.r
# 
# some weirdness
#
# why not test equality with floating point numbers
#
seven <- .7
two <- .2
one <- .1
# 
# surprised?
1 == (seven+two)+one
1 == seven+(two+one)
1 == (seven+one)+two
# 
# now look at representation
sprintf("%a",c(seven,two,one))       # three numbers
sprintf("%a",c(seven+two,one))       # partial sum
sprintf("%a",(seven+two)+one)        # why it's not one
sprintf("%a", 1)                     # this is one
#
# another from Kyle White
allbut970 <- c((959:969),(971:1023))
length(allbut970)
sum(2^allbut970)
# reference -- this should be biggest number
biggest <- .Machine$double.xmax
biggest
sprintf("%a",biggest)
#
sum(2^allbut970[-1])
sum(2^allbut970[-1])+2^allbut970[1]
#
# ok, that's weird enough, what are they internally?
sprintf("%a",sum(2^allbut970[-1]))
sprintf("%a",sum(2^allbut970[-1])+2^allbut970[1])
#
# now look at internal view of cumulative sums
c1 <- sprintf("%a",cumsum(2^allbut970[1:63]))
c2 <- sprintf("%a",cumsum(2^allbut970[2:64]))
cbind(c1,c2)
#
# clean up
rm(list=ls())
