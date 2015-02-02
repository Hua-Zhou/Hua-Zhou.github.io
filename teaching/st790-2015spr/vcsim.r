## 
## Demo of a simulation study comparing three methods
## for testing significance of a variance component
##
## Demo of using the parallel package to parallelize
## embarassingly parallel Monte carlo simulation
##
## Based on Yichi Zhang's ST758 (2012) HW7 submission
##

# clear up workspace
rm (list=ls())

# RLRsim package required for LR and RLR test
install.packages ("RLRsim")
# load libraries
library (compiler)
library (nlme) # requied for lme()
library (RLRsim)
library (parallel)

# generate design matrices for fixed and random effects
# n.pattern: a vector to give sample size in each group
#   returns a list 
# X: fixed effect design matrix
# Z: random effect design matrix
# qrX: the QR decomposition of X
# group.id: grouping indicators for random effects
# n: sample size
# k: number of levels of the random effect
generate.design <- function (n.pattern)
{
  k <- length (n.pattern)
  n <- sum (n.pattern)
  group.id <- rep (1:k, times = n.pattern)
  
  X <- cbind (rep (1, n))
  Z <- matrix (0, n, k)
  Z [cbind (1 : n, group.id)] <- 1
  
  list (X = X, Z = Z, qrX = qr(X), group.id = group.id, 
        n = n, k = k)
}

# generate response
# design: value returned by generate.design
# sigma2.ratio: the ratio of the variance of random effect to that of error term
#   returns a list
# y: response vector
# mu: fixed effect, i.e. grand mean
# alpha: random effects
generate.response <- function (design, sigma2.ratio)
{
  mu <- runif (1, -10, 10)
  if (sigma2.ratio > 0) {
    alpha <- rnorm (design$k, mean = 0, sd = sqrt(sigma2.ratio))
  } else {
    alpha <- numeric (design$k)
  }
  epsilon <- rnorm (design$n, mean = 0, sd = 1)
  y <- mu + alpha[design$group.id] + epsilon
  list (y = y, mu = mu, alpha = alpha)
}

# simulate samples from the exact null distributions of LRT and RLRT
# design: the value returned by generate.design
# null.size: the number of samples to be drawn
# returns a list:
# lrt: samples from the null distribution of LRT
# rlrt: samples from the null distribution of RLRT
simulate.null.samples <- function (design, null.size)
{
  lrt <- LRTSim (design$X, design$Z, 0, diag(design$k), 
                 nsim = null.size)
  rlrt <- RLRTSim (design$X, design$Z, design$qrX, diag (design$k), 
                   lambda0 = 0, nsim = null.size)
  list (lrt = lrt, rlrt = rlrt)
}

# compares the performance of three tests under a given setting
# n.pattern: a vector of sample sizes in each group
# sigma2.ratio: ratio of the variance of random effects to the variance of errors
# level: the significance level in testing
# null.size: number of samples drawn from the exact null distributions of LRT and RLRT
# mc.size: number of replications
# returns a list
# power: a matrix with probabilities of rejecting H0 and their MCSEs
# mcnemar: a matrix with the test statistics and p-values of McNemar's test
compare.tests <- function (n.pattern, sigma2.ratio, level = 0.05,
                           null.size = 200000, mc.size = 10000)
{
  design <- generate.design (n.pattern)
  null.samples <- simulate.null.samples (design, null.size)
  p.value <- numeric (3)
  decision <- matrix (0, 3, mc.size)
  
  for (i in 1 : mc.size) {
    response <- generate.response (design, sigma2.ratio)
    dataset <- data.frame (y = response$y, id = design$group.id)
    
    model0 <- lm (y ~ 1, data = dataset)
    model1 <- lme (y ~ 1, random = list (id = pdIdent(~ 1)), 
                   data = dataset, method = "ML")
    model2 <- lme (y ~ 1, random = list (id = pdIdent(~ 1)), 
                   data = dataset, method = "REML")
    
    lrt.observed <- 2 * (logLik (model1, REML = FALSE)[1] - 
                           logLik (model0, REML = FALSE)[1])
    rlrt.observed <- 2 * (logLik (model2, REML = TRUE)[1] - 
                            logLik (model0, REML = TRUE)[1])
    
    p.value[1] <- 0.5 * (lrt.observed <= 0) +
      0.5 * pchisq (lrt.observed, df = 1, lower.tail = FALSE)
    p.value[2] <- mean (null.samples$lrt >= lrt.observed)
    p.value[3] <- mean (null.samples$rlrt >= rlrt.observed)
    
    decision[, i] <- (p.value <= level)
  }
  
  rejection <- rowSums (decision)
  power <- rejection / mc.size
  power.adjusted <- (rejection + 2) / (mc.size + 4)
  power.mcse <- sqrt (power.adjusted * (1 - power.adjusted) 
                      / (mc.size + 4))
  power <- cbind (power = power, mcse = power.mcse)
  rownames (power) <- c("1", "2", "3")
  
  d1 <- factor (decision[1, ], levels = c(0, 1))
  d2 <- factor (decision[2, ], levels = c(0, 1))
  d3 <- factor (decision[3, ], levels = c(0, 1))
  m12 <- mcnemar.test (d1, d2)
  m13 <- mcnemar.test (d1, d3)
  m23 <- mcnemar.test (d2, d3)
  mcnemar.chisq <- c (m12$statistic, m13$statistic, m23$statistic)
  mcnemar.pvalue <- c (m12$p.value, m13$p.value, m23$p.value)
  mcnemar.chisq[is.na(mcnemar.chisq)] <- 0
  mcnemar.pvalue[is.na(mcnemar.pvalue)] <- 1
  mcnemar <- cbind (chi.squared = mcnemar.chisq, p.value = mcnemar.pvalue)
  rownames (mcnemar) <- c("1-2", "1-3", "2-3")
  
  list (power = power, mcnemar = mcnemar)
}

# compares the performance of three tests under various settings
compare.tests.all <- 
  function (n.pattern.list, sigma2.ratio.list,
            level = 0.05, null.size = 200000, mc.size = 10000)
  {
    m1 <- length (n.pattern.list)
    m2 <- length (sigma2.ratio.list)
    power <- mcnemar <- matrix (0, m1 * 3, m2 * 2)
    
    for (i1 in 1 : m1) {
      index1 <- 3 * (i1 - 1) + (1 : 3)
      for (i2 in 1 : m2) {
        index2 <- 2 * (i2 - 1) + (1 : 2)
        result <- 
          compare.tests (n.pattern.list[[i1]], 
                         sigma2.ratio.list[[i2]], level, null.size, mc.size)
        power[index1, index2] <- result$power
        mcnemar[index1, index2] <- result$mcnemar
      }
    }
    
    list (power = power, mcnemar = mcnemar)
  }

# compile functions
generate.design <- cmpfun (generate.design)
generate.response <- cmpfun (generate.response)
simulate.null.samples <- cmpfun (simulate.null.samples)
compare.tests <- cmpfun (compare.tests)
compare.tests.all <- cmpfun (compare.tests.all)

# record simulation settings
n.pattern.list <- list (
  c (3, 5, 7),
  c (1, 5, 9),
  c (1, 7, 7),
  c (3, 3, 5, 5, 7, 7),
  c (1, 1, 5, 5, 9, 9),
  c (1, 1, 7, 7, 7, 7),
  c (1, 1, 1, 1, 13, 13),
  c (3, 3, 3, 5, 5, 5, 7, 7, 7),
  c (1, 1, 1, 5, 5, 5, 9, 9, 9),
  c (1, 1, 1, 7, 7, 7, 7, 7, 7),
  c (1, 1, 1, 1, 1, 1, 1, 19, 19),
  c (2, 10, 18),
  c (3, 15, 27),
  c (5, 5, 5, 5, 5),
  c (30, 50, 70),
  c (500, 500, 500, 500, 500))

sigma2.ratio.list <- list (0, 0.1, 0.2, 0.5, 1.0, 2.0, 5.0)

# perform simulations -- serial code
set.seed (123, "L'Ecuyer")
system.time (result.serial <- compare.tests.all (
  n.pattern.list, sigma2.ratio.list, mc.size = 10))

# parallel simulations using mcmapply w/o load balancing
set.seed (123, "L'Ecuyer")
system.time (result.mcmapply <- mcmapply ( 
  compare.tests,
  rep (n.pattern.list, each = length (sigma2.ratio.list), times = 1),
  rep (sigma2.ratio.list, each = 1, times = length (n.pattern.list)),
  MoreArgs = list (mc.size = 10), mc.cores = 12))

# parallel simulations using mcmapply with load balancing
set.seed (123, "L'Ecuyer")
system.time (result.mcmapplylb <- mcmapply (
  compare.tests,
  rep (n.pattern.list, each = length(sigma2.ratio.list), times = 1),
  rep (sigma2.ratio.list, each = 1, times = length(n.pattern.list)),
  MoreArgs = list (mc.size = 10), mc.cores = 12, mc.preschedule = FALSE))

# parallel simulations using clusterMap w/o load balancing
cl <- makeCluster (getOption ("cl.cores", 12) )
clusterSetRNGStream(cl, 123)
clusterExport (cl, c("generate.design", "generate.response", "lme", "pdIdent",
                     "simulate.null.samples", "LRTSim", "RLRTSim"))
system.time (result.clusterMap <- clusterMap ( 
  cl, compare.tests,
  rep (n.pattern.list, each = length (sigma2.ratio.list), times = 1),
  rep (sigma2.ratio.list, each = 1, times = length (n.pattern.list)),
  MoreArgs = list (mc.size = 10), .scheduling = "static"))
stopCluster (cl)

# parallel simulations using clusterMap with load balancing
cl <- makeCluster (getOption ("cl.cores", 12))
clusterSetRNGStream(cl, 123)
clusterExport (cl, c ("generate.design", "generate.response", 
                     "simulate.null.samples"))
clusterEvalQ (cl, library(nlme))
clusterEvalQ (cl, library(RLRsim))
system.time (result.clusterMaplb <- clusterMap ( 
  cl, compare.tests,
  rep (n.pattern.list, each = length (sigma2.ratio.list), times = 1),
  rep (sigma2.ratio.list, each = 1, times = length (n.pattern.list)),
  MoreArgs = list (mc.size = 10), .scheduling = "dynamic"))
stopCluster (cl)
