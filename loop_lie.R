# loop_lie
setwd("C:/Users/WATS5I/prjct_SVD/ceu_yri_chb")
library(data.table)
# open and load Rho_alt.R
refGeno <- fread("ceu_yri_chb_A.raw") # work with this file and SVD
refGeno <- refGeno[ , -c(1:6)] # 857112 genotyped markers in set
pop_names <- read.csv("pop_names", sep="")
refGeno <- data.frame(pop_names, refGeno)
snpNo <- dim(refGeno)[2] - 2  # first two columns are ids and pops
RhoChr <- c(rep(0,snpNo))
timestamp() #takes about 45 minutes to run, try subsetting to get some faster results
##------ Fri May 26 08:47:34 2017 ------## this timestamp for Rho_alt function
for (i in 1:snpNo) {
  a <- refGeno[ ,2]
  b <- refGeno[,i+2]
  Rho_alt(a,b) -> RhoChr[i]
}
timestamp()
##------ Fri May 26 09:08:10 2017 ------## approx 20 minutes to run