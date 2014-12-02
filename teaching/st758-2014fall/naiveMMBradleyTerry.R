naiveMMBradleyTerry <- function(W, eps=1e-10, finalGamma=NULL) {
	startTime <- proc.time()
	p <- dim(W)[1]
	wins <- rowSums(W)
	G <- W + t(W) # symmetric matrix of games played
	delta <- rep(NA,1000)
	times <- matrix(NA, 1000, 5)
	gamma <- rep(1,p)/p
	done <- FALSE
	iteration <- 1
	initTime <- -startTime + (startTime<-proc.time()); 
	while (!done) {
		# The 'outer' call below does a lot of unnecessary work by creating a pxp
		# matrix, most of whose entries will be irrelevant after componentwise 
		# multiplication by G, which is a sparse matrix.
		sums <- outer(gamma,gamma,'+')
		newgamma <- wins / rowSums(G/sums)
		newgamma <- newgamma/sum(newgamma)
		done <- sqrt(sum((newgamma-gamma)^2)) < eps
		gamma <- newgamma
		if (!is.null(finalGamma)) { # Keep track of norm to final value
			delta[iteration] <- sqrt(sum((gamma-finalGamma)^2))
		}
		times[iteration,] <- -startTime + (startTime<-proc.time()); 
		iteration <- iteration+1
	}
	times[iteration,] <- -startTime + (startTime<-proc.time()); 
	list(initializationTime = initTime, 
		iterationTimes=times[1:(iteration),], 
		norms=delta[1:(iteration-1)], final=gamma)
}

