# autoSim.R

seed = 280
reps = 50
nVals = seq(100, 500, by=100)
distTypes = c("gaussian", "t1", "t5")

for (dist in distTypes) {
  for (n in nVals) {
    oFile = paste("n", n, "dist", dist, ".txt", sep="")
    arg = paste("n=", n, " dist=", shQuote(shQuote(dist)), 
                " seed=", seed, " reps=", reps, sep="")
    sysCall = paste("nohup Rscript runSim.R ", arg, " > ", oFile, sep="")
    system(sysCall)
    print(paste("sysCall=", sysCall, sep=""))
  }
}
