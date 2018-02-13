## parsing command arguments
for (arg in commandArgs(TRUE)) {
  eval(parse(text = arg))
}

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

print(msePrimeAvg / reps)
print(mseSamplAvg / reps)