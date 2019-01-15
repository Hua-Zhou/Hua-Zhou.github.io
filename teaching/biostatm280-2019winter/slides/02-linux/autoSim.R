# autoSim.R

nVals <- seq(100, 1000, by=100)
for (n in nVals) {
  oFile <- paste("n", n, ".txt", sep="")
  sysCall <- paste("nohup Rscript runSim.R n=", n, " > ", oFile, sep="")
  system(sysCall)
  print(paste("sysCall=", sysCall, sep=""))
}


