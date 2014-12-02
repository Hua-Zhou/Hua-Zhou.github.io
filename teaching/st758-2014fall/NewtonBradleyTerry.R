NewtonBradleyTerry <- function(W, eps=1e-10, finalGamma=NULL) {
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
	delta <- rep(NA,1000) # Warning! This line and the next must be changed
	times <- matrix(NA, 1000, 5) # if more than 1000 iterations are possible.
	lambda <- rep(0,p) # Initialize parameter. NB: lambda is on the log
			 		 # scale, so gamma=exp(lambda)
	gamma <- exp(lambda)
	gamma <- gamma/sum(gamma) # Not really necessary for the first iteration
	done <- FALSE
	iteration <- 1
	initTime <- -startTime + (startTime<-proc.time()); 
	while (!done) {
		v1 <- gamma[GG[,1]]
		v2 <- gamma[GG[,2]]
		probs <- v1/(v1+v2)
		tmp <- GG[,3] * probs
		dL <- wins - diff(c(0,cumsum(tmp)[last])) # Gradient
		# The cumsum method above avoids doing a lot of unnecessary 
		# calculations for the zero entries of G; it's a bit harder
		# to understand the code but it's much more efficient.
		d2L <- sparseMatrix(i=GG[,1], j=GG[,2], x=tmp * (1-probs))
		# There is no easy way to use the 3-column representation to
		# solve a large linear system. Thus, we define the Hessian
		# matrix d2L using the usual sparse matrix tools in the Matrix
		# package.
		diag(d2L) <- -rowSums(d2L)
		## Fix pth parameter at lambda_p=0. Thus, only consider
		## (p-1)x(p-1) matrices
		change <- as.vector(solve(d2L[-p,-p], -dL[-p]))
		# NB: Newton's method does not actually invert the Hessian;
		# instead, it solves a large linear system of equations,
		# which can actually be done more efficiently than calculating
		# the inverse.
		done <- sqrt(sum(change^2)) < eps
		lambda[-p] <- lambda[-p] + change
		gamma <- exp(lambda); gamma <- gamma/sum(gamma)
		if (!is.null(finalGamma)) { # Keep track of norm to final value
			delta[iteration] <- sqrt(sum((gamma-finalGamma)^2))
		}
		times[iteration,] <- -startTime + (startTime<-proc.time()); 
		iteration <- iteration+1
	}
	gamma <- exp(lambda); gamma <- gamma/sum(gamma)
	times[iteration,] <- -startTime + (startTime<-proc.time()); 
	list(initializationTime = initTime, 
		iterationTimes=times[1:(iteration),], 
		norms=delta[1:(iteration-1)], final=gamma)
}

