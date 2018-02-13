# resSim.R
# collect simulation results

nVals <- seq(100, 500, by=100)
distTypes <- c("gaussian", "t1", "t5")

msePrimeAvg <- matrix(0, nrow = length(nVals), ncol = length(distTypes))
colnames(msePrimeAvg) <- distTypes
mseSamplAvg <- matrix(0, nrow = length(nVals), ncol = length(distTypes))
colnames(mseSamplAvg) <- distTypes

c = 0 # column
for (dist in distTypes) {
  c = c + 1
  r = 0 # row
  for (n in nVals) {
    r = r + 1
    oFile = paste("n", n, "dist", dist, ".txt", sep="")
    oData = read.table(oFile)
    msePrimeAvg[r, c] = oData[1, 2]
    mseSamplAvg[r, c] = oData[2, 2]
  }
}

library("tidyverse")
msePrimeAvgDf <- as.tibble(msePrimeAvg) %>% mutate(n = nVals)
mseSamplAvgDf <- as.tibble(mseSamplAvg) %>% mutate(n = nVals)
res <- 
  bind_rows("PrimeAvg" = msePrimeAvgDf, "SamplAvg" = mseSamplAvgDf, .id = "Method") %>%
  select(n, Method, gaussian, t5, t1) %>%
  arrange(n)

