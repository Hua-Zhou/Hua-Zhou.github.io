MMBradleyTerry <- function(W, eps=1e-10, finalGamma=NULL) {
	startTime <- proc.time()
	p <- dim(W)[1]
	wins <- rowSums(W)
	G <- W + t(W) # symmetric matrix of games played
	# Now code G in so-called "triplet" sparse-matrix form:
	# Three columns giving row, column, and value
	GT <- as(G, "dgTMatrix"); GG <- cbind(1+GT@i, 1+GT@j, GT@x); rm(GT)
	GG <- GG[order(GG[,1]),] # Sort in row-first dictionary order
	# GG is an explicit representation of the sparse matrix in 3-column
	# matrix form; this allows for code that avoids unnecessary outer
	# products
	last <- (GG[,1] != c(GG[-1,1],0)) # TRUE for last entry in each "row"
	delta <- rep(NA,1000)
	times <- matrix(NA, 1000, 5)
	gamma <- rep(1,p)/p
	done <- FALSE
	iteration <- 1
	initTime <- -startTime + (startTime<-proc.time()); 
	while (!done) {
		tmp <- GG[,3] / (gamma[GG[,1]]+gamma[GG[,2]])
		newgamma <- wins / diff(c(0,cumsum(tmp)[last]))		
		# The cumsum method above avoids doing a lot of unnecessary 
		# calculations for the zero entries of G; it's a bit harder
		# to understand the code but it's much more efficient.
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

