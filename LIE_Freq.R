lie_freq <- function(k,frq_pop,count_pop){
  # k = number of populations
  # frq_pop = arguments exclusively either MAF or Ref allele frequencies;vector length k
  # count_pop = corresponding population counts; vector length k
  
  if (k%%1!=0) stop("must be an integer")
  if (!all(frq_pop>=0 & frq_pop<=1)) stop("all components must belong to [0,1]")
  if (length(frq_pop)!=k) stop("vector length must be k") 
  
  if (!all(count_pop%%1==0)) stop("all components must belong to be integers")
  if (length(count_pop)!=k) stop("vector length must be k")
  n <- sum(count_pop)
  
  tbl <- matrix(0, nrow = k, ncol = 3)
  for (i in 1:k) {
    f_a <- 1 - frq_pop[i]
    t_1 <- count_pop[i]*c(frq_pop[i]^2, 2*frq_pop[i]*f_a, f_a^2)
    tbl[i,] <- t_1
  }
  nrows <- k
  ncols <- 3
  rho <-0
  
  for(i in 1:nrows){
    for(j in 1:ncols){
      if ((sum(tbl[i,]) * sum(tbl[,j])==0)) r <- 0 else
            r = tbl[i,j]^2/(sum(tbl[i,]) * sum(tbl[,j]))
            rho = rho + r
    }
  }    
  return(rho - 1)
}  
# The arguments of function are:
# k = number of populations
# frq_pop =  vector of allele frequencies (length must be equal to k, each element corresponds to the population allele frequency: exclusively either MAF or Ref allele)
# count pop = vector of population counts (length must be equal to k) 

