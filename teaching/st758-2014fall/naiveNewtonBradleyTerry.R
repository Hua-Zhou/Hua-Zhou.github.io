naiveNewtonBradleyTerry <- function(W, eps=1e-10, finalGamma=NULL) {
	startTime <- proc.time()
	p <- dim(W)[1]
	wins <- rowSums(W)
	G <- W + t(W) # symmetric matrix of games played
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
		# The 'outer' call below does a lot of unnecessary work by creating a pxp
		# matrix, most of whose entries will be irrelevant after componentwise 
		# multiplication by G, which is a sparse matrix.
		probs <- outer(gamma, gamma, function(a,b) a/(a+b))
		dL <- wins - rowSums(G * probs) # Gradient
		d2L <- G * probs * t(probs) # Hessian
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
			delta[iteration] = sqrt(sum((gamma-finalGamma)^2))
		}
		times[iteration,] = -startTime + (startTime<-proc.time()); 
		iteration = iteration+1
	}
	gamma <- exp(lambda); gamma <- gamma/sum(gamma)
	times[iteration,] = -startTime + (startTime<-proc.time()); 
	list(initializationTime = initTime, 
		iterationTimes=times[1:(iteration),], 
		norms=delta[1:(iteration-1)], final=gamma)
}

