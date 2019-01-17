## check if a given integer is prime
isPrime = function(n) {
  if (n <= 3) {
    return (TRUE)
  }
  if (any((n %% 2:floor(sqrt(n))) == 0)) {
    return (FALSE)
  }
  return (TRUE)
}

## estimate mean only using observation with prime indices
estMeanPrimes = function(x) {
  n <- length(x)
  ind <- sapply(1:n, isPrime)
  return (mean(x[ind]))
}

## compare methods: sample avg and prime-indexed avg
compare_methods <- function(dist = "gaussian", n = 100, reps = 100, seed = 123) {
  # set seed according to command argument `seed`
  set.seed(seed)
  
  # preallocate space to store estimators
  msePrimeAvg <- 0.0
  mseSamplAvg <- 0.0
  # loop over simulation replicates
  for (r in 1:reps) {
    # simulate data according to command arguments `n` and `distr`
    if (dist == "gaussian") {
      x = rnorm(n)
    } else if (dist == "t1") {
      x = rcauchy(n)
    } else if (dist == "t5") {
      x = rt(n, 5)
    } else {
      stop(paste("unrecognized dist: ", dist))
    }
    # prime indexed mean estimator and classical sample average estimator
    msePrimeAvg <- msePrimeAvg + estMeanPrimes(x)^2 
    mseSamplAvg <- mseSamplAvg + mean(x)^2
  }
  mseSamplAvg <- mseSamplAvg / reps
  msePrimeAvg <- msePrimeAvg / reps
  return(c(mseSamplAvg, msePrimeAvg))
}

seed = 280
reps = 500
nVals = seq(100, 1000, by = 50)
distTypes = c("gaussian", "t5", "t1")

## simulation study with combination of generative model `dist` and
## sample size `n` (serial code)
simres1 = matrix(0.0, nrow = 2 * length(nVals), ncol = length(distTypes))
i = 1 # entry index
system.time(
  for (dist in distTypes) {
    for (n in nVals) {
      print(paste("n=", n, " dist=", dist, " seed=", seed, " reps=", reps, sep=""))
      simres1[i:(i + 1)] = compare_methods(dist, n, reps, seed)
      i <- i + 2
    }
  }
)
simres1

## simulation study with combination of generative model `dist` and
## sample size `n` (parallel code using mcmapply)
library(parallel)
system.time({
simres2 <- mcmapply(compare_methods, 
                       rep(distTypes, each = length(nVals), times = 1),
                       rep(nVals, each = 1, times = length(distTypes)),
                       reps, 
                       seed,
                       mc.cores = 4)
})
simres2 <- matrix(unlist(simres2), ncol = length(distTypes))
simres2

## simulation study with combination of generative model `dist` and
## sample size `n` (parallel code using clusterMap)
cl <- makeCluster(getOption ("cl.cores", 4))
clusterExport(cl, c("isPrime", "estMeanPrimes", "compare_methods"))
system.time({
  simres3 <- clusterMap(cl, compare_methods, 
                      rep(distTypes, each = length(nVals), times = 1),
                      rep(nVals, each = 1, times = length(distTypes)),
                      reps, 
                      seed,
                      .scheduling = "dynamic")
})
simres3 <- matrix(unlist(simres3), ncol = length(distTypes))
stopCluster(cl)
simres3