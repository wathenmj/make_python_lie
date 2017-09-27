# func_lie
# x is genotype for number of reference alleles
x <- c(0,0,0,1,0,0,1,0,0,1,0,1,2,0,0,0,1,2,2,0,1,0,0,0,1,0,0,1,0)
# y is corresponding populatio membership
y <- c('YRI','CEU','CEU','ASW','CEU','CEU','ASW','CEU',
       'CEU','YRI','YRI','YRI','YRI','YRI','YRI','CEU','ASW','CEU','CEU','CEU','ASW',
       'CEU','CEU','CEU','YRI','CEU','CEU','ASW','CEU')


lie <- function(x,y){
  temp <- as.matrix(table(x,y))
  tbl <-as.matrix(prop.table(temp))
  nrows <- nrow(tbl)
  ncols <- ncol(tbl)
  rho <-0
  if(ncols == 1 || nrows ==1)rho <- 0 else{
    for(i in 1:nrows){
      for(j in 1:ncols){
        r = tbl[i,j]^2/(sum(tbl[i,]) * sum(tbl[,j]))
        rho = rho + r
      }
    }
  }
  return(rho -1)
}
lie(x,y)
