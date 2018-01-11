# autoSim.R

nVals = seq(50, 500, by=50)
for (n in nVals) {
  oFile = paste("n", n, ".txt", sep="")
  arg = paste("n=", n, sep="")
  sysCall = paste("nohup Rscript runSim.R ", arg, " > ", oFile)
  system(sysCall)
  print(paste("sysCall=", sysCall, sep=""))
}


